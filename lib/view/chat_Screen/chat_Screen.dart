import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/chat_Screen/widgets/daywiseMsgListWidget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppbarSection(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InboxSearchSection(),
              SizedBox(
                height: 240 * 4,
                child: ListView.separated(
                    shrinkWrap: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => daywiseMsgListWidget(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 1,
                        ),
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _InboxSearchSection() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              fillColor: ColorConstants.secondaryColor.withOpacity(0.5),
              filled: true,
              prefixIconColor: ColorConstants.Maingrey,
              prefixIcon: Icon(Icons.search),
              hintText: "Search..",
              hintStyle: TextStyle(color: ColorConstants.Maingrey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  AppBar _AppbarSection() {
    return AppBar(
      forceMaterialTransparency: true,
      title: Center(
        child: Text(
          "Inbox",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
