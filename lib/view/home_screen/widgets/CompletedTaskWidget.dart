import 'package:flutter/material.dart';
import 'package:task_manager_application/utils/constants/color_constants.dart';
import 'package:task_manager_application/view/global_widgets/overlappingCircleAvatarWidget.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({
    super.key,
    required this.SampleImage,
  });

  final List SampleImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 160,
      color: ColorConstants.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Real Estate Website Design",
              style: TextStyle(fontSize: 25, height: .9),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Team Members",
                  style: TextStyle(fontSize: 11),
                ),
                for (int i = 0; i < SampleImage.length; i++) ...{
                  OverlappingCircleAvatarWidget(
                    imageUrl: SampleImage[i],
                  )
                }
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Completed",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
                Text(
                  "100%",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              value: 0.5,
              color: ColorConstants.mainBlack,
            )
          ],
        ),
      ),
    );
  }
}
