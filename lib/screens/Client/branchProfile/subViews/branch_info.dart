import 'package:flutter/material.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Helpers/localization/app_localizations_delegates.dart';
import 'package:techtime/screens/Client/branchProfile/components/branch_adress_container.dart';
import 'package:techtime/screens/Client/branchProfile/components/branch_working_hours.dart';
import 'package:techtime/screens/Client/branchProfile/components/employee_card.dart';
import 'package:techtime/screens/Client/branchProfile/components/info_card_title.dart';

class BranchInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations _translator = AppLocalizations.of(context);
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      BranchAddressContainer(),
                      BranchWorkingHours(),
                      Container(
                          width: _size.width,
                          child: Card(
                              elevation: 10,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: KDefaultPadding, horizontal: 5),
                                  child: Wrap(children: [
                                    InfoCardHeader(
                                      title: _translator.translate("staff"),
                                      icon: Icons.person_outline,
                                    ),
                                    GridView.count(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.all(KDefaultPadding),
                                      crossAxisCount: 3,
                                      children: <Widget>[
                                        EmployeeCard(),
                                        EmployeeCard(),
                                        EmployeeCard(),
                                        EmployeeCard(),
                                        EmployeeCard(),
                                      ],
                                    ),
                                  ]))))
                    ],
                  ),
                ))));
  }
}