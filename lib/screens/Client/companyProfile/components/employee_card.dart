import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/widgets/client/custom_circle_avatar.dart';
import 'package:techtime/widgets/core/vertical_gab.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleAvatar(
          height: 60,
          width: 60,
          image: null,
        ),
        VerticalGap(height: KDefaultPadding / 2),
        Text("name"),
        VerticalGap(height: KDefaultPadding / 2),
        SmoothStarRating(
          isReadOnly: true,
          size: 14,
          rating: 5.0,
        )
      ],
    );
  }
}