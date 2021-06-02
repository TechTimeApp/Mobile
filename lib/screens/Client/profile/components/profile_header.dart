import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtime/Controllers/providers/current_user_provider.dart';
import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Models/client_profile.dart';
import 'package:techtime/widgets/client/custom_circle_avatar.dart';

class HeaderProfileAvatar extends StatelessWidget {
  const HeaderProfileAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProfile _currentUser =
        Provider.of<CurrentUserProvider>(context, listen: false).currentUser;
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircleAvatar(
              image: _currentUser?.image ?? null,
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: KdefaultPadding,
            ),
            Text(
              _currentUser?.firstName ?? KAppName,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}
