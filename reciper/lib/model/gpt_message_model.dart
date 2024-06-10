// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GPTMessageModel {
  final String content;
  final GPTRoleType role;
  GPTMessageModel({
    required this.content,
    required this.role,
  });

  GPTMessageModel copyWith({
    String? content,
    GPTRoleType? role,
  }) {
    return GPTMessageModel(
      content: content ?? this.content,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'role': role.name,
    };
  }

  factory GPTMessageModel.fromMap(Map<String, dynamic> map) {
    return GPTMessageModel(
      content: map['content'] as String,
      role: convertGPTRoleType(map['role']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GPTMessageModel.fromJson(String source) =>
      GPTMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GPTMessageModel(message: $content, role: $role)';

  @override
  bool operator ==(covariant GPTMessageModel other) {
    if (identical(this, other)) return true;

    return other.content == content && other.role == role;
  }

  @override
  int get hashCode => content.hashCode ^ role.hashCode;
}

enum GPTRoleType {
  system, assistant, user
}

GPTRoleType convertGPTRoleType(String text) =>
    GPTRoleType.values.firstWhere((element) => element.name == text);
