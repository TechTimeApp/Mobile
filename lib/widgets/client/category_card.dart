import 'package:flutter/material.dart';
import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Helpers/colors.dart';
import 'package:techtime/models/client/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double width;

  const CategoryCard({Key key, this.category, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/CompaniesListPage",
          arguments: category),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: KdefaultPadding / 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: KdefaultPadding / 4),
                  padding: EdgeInsets.all(2),
                  width: width ?? 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: KPrimaryColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          BorderRadius.all(Radius.circular(KdefaultRadius)),
                      image: DecorationImage(
                          image: NetworkImage(KAPIURL + category.image),
                          repeat: ImageRepeat.noRepeat,
                          // alignment: Alignment.center,
                          fit: BoxFit.fill)),
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  category.categoryEn,
                  style: Theme.of(context).textTheme.subtitle2,
                ))
          ],
        ),
      ),
    );
  }
}
