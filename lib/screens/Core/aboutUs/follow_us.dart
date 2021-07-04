import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/colors.dart';
import 'package:techtime/Helpers/oval_bottom_clipper.dart';
import 'package:techtime/Helpers/utils/app_intents.dart';

class FollowUsScreen extends StatelessWidget {
  const FollowUsScreen({Key key}) : super(key: key);
  static const String routeName = '/follow_us';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    // ThemeData _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          height: _size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.png",
                ),
                fit: BoxFit.cover),
            color: KPrimaryColor,
          ),
        ),
      ),
      body: FollowUsBody(),
    );
  }
}

class FollowUsBody extends StatelessWidget {
  const FollowUsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ThemeData _theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: _size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/background.png",
                      ),
                      fit: BoxFit.cover),
                  color: KPrimaryColor,
                ),
                child: Center(
                    child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/logo.svg",
                        height: 50,
                      ),
                      Text(KAppName,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
              ),
            )),
        Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Tech Time",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: _theme.textTheme.subtitle2.copyWith(
                              color: KPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: _size.width * 0.8,
                            child: Text(
                              '''• Tech Time covers a wide range of businesses.
• Book an appointment nearby.
• Explore all the year offers nearby.
• Get reminded of your upcoming bookings.
• Manage your invoices.
• Easily communicate with businesses via the built-in chat.
• Enjoy the booking journey through our delightful UI/UX.''',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.justify,
                              style: _theme.textTheme.caption
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://www.facebook.com/TechTimeEgypt",
                                "com.facebook.katana")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/twitter.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://twitter.com/TechTimeApp1?s=09",
                                "com.twitter.android")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/Google+.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "google.navigation:q=31.2600466,29.9867037",
                                "com.google.android.apps.maps")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/linkedin.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://www.linkedin.com/in/tech-time-2141701ba/",
                                "com.linkedin.android.home.UpdateStatusActivity")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://www.instagram.com/techtimeegypt/?igshid=8t5hzl043ae3",
                                "com.instagram.android")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/telegram.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://t.me/joinchat/UqIHHe4u80GKwZXc",
                                "org.telegram.messenger")),
                        IconButton(
                            color: KErrorColor,
                            icon: SvgPicture.asset(
                              'assets/svg/youtube.svg',
                              color: KPrimaryColor,
                            ),
                            onPressed: () => VisitApp().callApp(
                                "https://www.youtube.com/channel/UCSRZSdPqE8kBIp7As9dlLtg",
                                "com.google.android.youtube")),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "© 2021 Tech Time All rights reserved. \n Powered by TechTime",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: _theme.textTheme.caption
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
