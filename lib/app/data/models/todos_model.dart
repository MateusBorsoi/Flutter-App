

import 'dart:convert';

class TodosModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodosModel({
    required this.userId,
     required this.id, 
     required this.title, 
     required this.completed
     });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'userId': userId,
      'id':id,
      'title': title,
      'completed':completed,
    };
  }

  factory TodosModel.fromMap(Map<String, dynamic> map){
    return TodosModel(
      userId: map['userId'], 
      id: map['id'], 
      title: map['title'],
       completed: map['completed']
       );
  }
  String toJson() => json.encode(toMap());

  factory TodosModel.fromJson(String source) =>
  TodosModel.fromMap(json.decode(source));
}
