import 'package:equatable/equatable.dart';
import 'package:reciper/model/gpt_message_model.dart';

abstract class AiEvent extends Equatable {
  final GPTMessageModel? response;
  final String? imagePath;
  final String message;
  const AiEvent(
    this.message, {
    this.response,
    this.imagePath,
  });

  @override
  List<Object> get props => [];
}

class InitialAiEvent extends AiEvent {
  const InitialAiEvent(super.message);
}

class LoadingAiEvent extends AiEvent {
  const LoadingAiEvent(super.message, {String? imagePath});
}

class SuccessAiEvent extends AiEvent {
  const SuccessAiEvent(super.message,
      {required GPTMessageModel response, String? imagePath});
}

class ErrorAiEvent extends AiEvent {
  const ErrorAiEvent(super.message);
}
