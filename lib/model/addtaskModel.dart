import 'package:flutter/foundation.dart';

class Addtaskmodel {
  int? id;
  String? user_id;
  String? taskName;
  String? taskcategory;
  String? Date;
  String? startTime;
  String? endTime;
  String? description;

  Addtaskmodel(
      {this.id,
      this.user_id,
      this.taskName,
      this.taskcategory,
      this.Date,
      this.startTime,
      this.endTime,
      this.description});

  factory Addtaskmodel.fromMap(Map<String, dynamic> json) => Addtaskmodel(
      id: json["id"],
      user_id: json["user_id"],
      taskName: json["taskName"],
      taskcategory: json["taskcategory"],
      Date: json["Date"],
      startTime: json["startTime"],
      endTime: json["endTime"],
      description: json["description"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": user_id,
        "taskName": taskName,
        "taskcategory": taskcategory,
        "Date": Date,
        "startTime": startTime,
        "endTime": endTime,
        "description": description
      };
}
