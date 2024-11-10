import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class messageListTileWidget extends StatelessWidget {
  messageListTileWidget({
    this.imageUrl =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    super.key,
  });
  String imageUrl;
  String name;
  String lastMessage;
  String lastMessageTime;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        lastMessage,
        style: TextStyle(
            color: ColorConstants.Maingrey, fontWeight: FontWeight.w500),
      ),
      trailing: Text(lastMessageTime),
    );
  }
}
