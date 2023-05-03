
import 'dart:convert';

List<Email> emailFromMap(String str) => List<Email>.from(json.decode(str).map((x) => Email.fromMap(x)));

String emailToMap(List<Email> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Email {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Email({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Email.fromMap(Map<String, dynamic> json) => Email(
    postId: json["userId"] ?? 0,
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["title"] ?? "",
    body: json["body"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
