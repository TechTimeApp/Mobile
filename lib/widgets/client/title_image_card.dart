import 'package:flutter/material.dart';
import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Helpers/colors.dart';
import 'package:techtime/models/client/category.dart';

class TitleImageCard extends StatelessWidget {
  final Category category;
  const TitleImageCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: KdefaultPadding),
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(color: KPrimaryColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(KdefaultRadius)),
          image: DecorationImage(
              image: NetworkImage(KAPIURL + category.image),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              repeat: ImageRepeat.noRepeat,
              // alignment: Alignment.center,
              fit: BoxFit.fill)),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: KdefaultPadding),
            child: Text(
              category.categoryEn ?? '',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
