import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';

class OverlappingCircleAvatarWidget extends StatelessWidget {
  OverlappingCircleAvatarWidget({
    required this.imageUrl,
    super.key,
  });
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.5,
      child: CircleAvatar(
        backgroundColor: ColorConstants.primaryColor,
        radius: 12,
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
