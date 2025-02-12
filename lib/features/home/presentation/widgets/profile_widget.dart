import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/profile_picture.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfilePicture.network(
          path: '',
        ),
        CustomSpacers.width16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UserHelper.getUserName(),
              style: AppTextThemes.of(context).titleLarge,
            ),
            CustomSpacers.height4,
            Text(
              'Joined: ${UserHelper.getJoiningDate()}',
              style: AppTextThemes.of(context).labelMedium,
            ),
          ],
        )
      ],
    );
  }
}
