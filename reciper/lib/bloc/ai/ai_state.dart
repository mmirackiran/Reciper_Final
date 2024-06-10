import 'package:equatable/equatable.dart';
import 'package:reciper/bloc/ai/ai_event.dart';
import 'package:reciper/model/gpt_message_model.dart';

class AiState extends Equatable {
  final GPTMessageModel? response;
  final AiEvent event;

  const AiState(this.event, {this.response});

  @override
  List<Object?> get props => [response];
}
