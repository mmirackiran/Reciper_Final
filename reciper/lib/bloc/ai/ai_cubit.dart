import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reciper/bloc/ai/ai_event.dart';
import 'package:reciper/bloc/ai/ai_state.dart';
import 'package:reciper/core/services/gpt_api_service.dart';
import 'package:reciper/model/ask_type.dart';
import 'package:reciper/model/gpt_message_model.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(const AiState(InitialAiEvent("Initial")));
  final GptApiService _dataService = GptApiService();

  Future<void> askToAi(
      String locale, AskType askType, String? name, ImageSource? source) async {
    void sendImage(File imageFile) async {
      emit(AiState(LoadingAiEvent('Loading...', imagePath: imageFile.path)));
      GPTMessageModel? model =
          await _dataService.sendFoodImage(imageFile.path, locale);
      if (model != null) {
        emit(AiState(
            SuccessAiEvent('Success',
                response: model, imagePath: imageFile.path),
            response: model));
      } else {
        emit(const AiState(ErrorAiEvent('Error')));
      }
    }

    void sendText(String text) async {
      emit(const AiState(LoadingAiEvent('Loading...')));
      GPTMessageModel? model = await _dataService.sendFoodName(
          GPTMessageModel(content: text, role: GPTRoleType.user), locale);
      if (model != null) {
        emit(AiState(
            SuccessAiEvent(
              'Success',
              response: model,
            ),
            response: model));
      } else {
        emit(const AiState(ErrorAiEvent('Error')));
      }
    }

    try {
      if (askType == AskType.name) {
        sendText(name ?? '');
      } else {
        XFile? result = await ImagePicker()
            .pickImage(source: source ?? ImageSource.gallery);
        result != null
            ? sendImage(File(result.path))
            : emit(const AiState(ErrorAiEvent('Image not selected')));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(const AiState(ErrorAiEvent('Error')));
    }
  }
}
