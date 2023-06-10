// To parse this JSON data, do
//
//     final chatAsUser = chatAsUserFromJson(jsonString);

import 'dart:convert';

ChatAsUser chatAsUserFromJson(String str) => ChatAsUser.fromJson(json.decode(str));

String chatAsUserToJson(ChatAsUser data) => json.encode(data.toJson());

class ChatAsUser {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final Usage? usage;
  final List<Choice>? choices;

  ChatAsUser({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  factory ChatAsUser.fromJson(Map<String, dynamic> json) {
    return ChatAsUser(
      id: json["id"],
      object: json["object"],
      created: json["created"],
      model: json["model"],
      usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
      choices: json["choices"] == null
          ? []
          : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "object": object,
      "created": created,
      "model": model,
      "usage": usage?.toJson(),
      "choices": choices == null
          ? []
          : List<dynamic>.from(choices!.map((x) => x.toJson())),
    };
  }
}

class Choice {
  final Message? message;
  final String? finishReason;
  final int? index;

  Choice({
    this.message,
    this.finishReason,
    this.index,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
      finishReason: json["finish_reason"],
      index: json["index"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message?.toJson(),
      "finish_reason": finishReason,
      "index": index,
    };
  }
}

class Message {
  final String? role;
  final String? content;

  Message({
    this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      role: json["role"],
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "role": role,
      "content": content,
    };
  }
}

class Usage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json["prompt_tokens"],
      completionTokens: json["completion_tokens"],
      totalTokens: json["total_tokens"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "prompt_tokens": promptTokens,
      "completion_tokens": completionTokens,
      "total_tokens": totalTokens,
    };
  }
}

