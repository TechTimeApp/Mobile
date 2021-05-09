import 'package:flutter/material.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Helpers/localization/app_localizations_delegates.dart';
import 'package:techtime/widgets/appointment_card.dart';
import 'package:techtime/widgets/core/vertical_gab.dart';

final items = List<String>.generate(3, (i) => "Item ${i + 1}");

class PreviousAppointments extends StatefulWidget {
  @override
  _PreviousAppointmentsState createState() => _PreviousAppointmentsState();
}

class _PreviousAppointmentsState extends State<PreviousAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return PreviousAppointmentCard();
        },
      ),
    );
  }
}

class PreviousAppointmentCard extends StatelessWidget {
  const PreviousAppointmentCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations _translator = AppLocalizations.of(context);
    ThemeData _theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: AppointmentCard(
            theme: _theme,
            translator: _translator,
            isReadOnly: true,
            title: "صالون بيوتى",
            description: "تقديم خدمات لكافة مستلزمات الافراح",
            address: "شارع 33, منطقة الميدان, جدة",
            rating: 4.8,
            image: KPlaceHolderCover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListBody(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  _translator.translate("book_again"),
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        VerticalGap(),
      ],
    );
  }
}