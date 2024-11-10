import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/chat_Screen/widgets/messageListTileWidget.dart';

class daywiseMsgListWidget extends StatelessWidget {
  const daywiseMsgListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Today",
            style: TextStyle(fontSize: 16, color: ColorConstants.Maingrey),
          ),
        ),
        SizedBox(
          height: 80 * 4,
          child: ListView.separated(
            shrinkWrap: false,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => messageListTileWidget(
              imageUrl:
                  "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              name: "John Doe",
              lastMessage: "Last Message",
              lastMessageTime: "12:40",
            ),
            itemCount: 4,
            separatorBuilder: (context, index) => SizedBox(),
          ),
        ),
      ],
    );
  }
}
