import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:techtime/Controllers/BLoCs/client/profile_edit_blocs/edit_mobile_bloc/editmobile_bloc.dart';
import 'package:techtime/Controllers/Repositories/Auth/repository.dart';
import 'package:techtime/Controllers/blocs/client/profileBloc/profile_bloc.dart';
import 'package:techtime/Controllers/blocs/client/profile_edit_blocs/edit_email_bloc/editemailaddress_bloc.dart';
import 'package:techtime/Controllers/blocs/client/profile_edit_blocs/edit_first_name_bloc/editfirstname_bloc.dart';
import 'package:techtime/Controllers/blocs/client/profile_edit_blocs/edit_second_name_bloc/editsecondname_bloc.dart';

import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/app_consts.dart';
import 'package:techtime/Helpers/colors.dart';
import 'package:techtime/Helpers/localization/app_localizations_delegates.dart';
import 'package:techtime/Models/client_profile.dart';
import 'components/cover_and_image.dart';
import 'components/profile_text_field.dart';

class ProfileEdit extends StatefulWidget {
  static const String routeName = "/profile_edit";

  const ProfileEdit({Key key}) : super(key: key);
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  UserProfile _userProfile;
  AuthRepo _authRepo = AuthRepo();
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _mobileController;
  TextEditingController _passwordController =
      TextEditingController(text: "Password");

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(FetchProfileData());
    _userProfile = _authRepo.currentUserProfile;
    _firstNameController =
        TextEditingController(text: _userProfile.firstName ?? "FirstName");
    _lastNameController =
        TextEditingController(text: _userProfile.lastName ?? "LastName");
    _emailController =
        TextEditingController(text: _userProfile.email ?? "email");
    _mobileController =
        TextEditingController(text: _userProfile.mobile.toString() ?? "mobile");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: ProfileCoverAndImage(
                      userData: _userProfile,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(top: _size.height * 0.18),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProfileTextField(
                                controller: _firstNameController,
                                suffixWidget: BlocConsumer<EditfirstnameBloc,
                                    EditfirstnameState>(
                                  listener: (context, state) {
                                    if (state is EditFirstNamesuccess) {
                                      buildSuccessMessage();
                                    } else if (state is EditFirstNameFaild) {
                                      buildErrorMessage(state.message);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is EditFirstNameLoading) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: KdefaultPadding),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      return SuffixTextButton(
                                        onPressed: () =>
                                            BlocProvider.of<EditfirstnameBloc>(
                                                    context)
                                                .add(EditFirstName(
                                                    _firstNameController.text)),
                                      );
                                    }
                                  },
                                ),
                                theme: _theme),
                            ProfileTextField(
                                controller: _lastNameController,
                                suffixWidget: BlocConsumer<EditLastnameBloc,
                                    EditLastnameState>(
                                  listener: (context, state) {
                                    if (state is EditLastNamesuccess) {
                                      buildSuccessMessage();
                                    } else if (state is EditLastNameFaild) {
                                      buildErrorMessage(state.message);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is EditLastNameLoading) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: KdefaultPadding),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      return SuffixTextButton(
                                        onPressed: () =>
                                            BlocProvider.of<EditLastnameBloc>(
                                                    context)
                                                .add(EditLastName(
                                                    _lastNameController.text)),
                                      );
                                    }
                                  },
                                ),
                                theme: _theme),
                            ProfileTextField(
                                suffixWidget: BlocConsumer<EditemailaddressBloc,
                                    EditemailaddressState>(
                                  listener: (context, state) {
                                    if (state is EditEmailAddresssuccess) {
                                      buildSuccessMessage();
                                    } else if (state is EditEmailAddressFaild) {
                                      buildErrorMessage(state.message);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is EditEmailAddressLoading) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: KdefaultPadding),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      return SuffixTextButton(
                                        onPressed: () => BlocProvider.of<
                                                EditemailaddressBloc>(context)
                                            .add(EditEmailAddress(
                                                _emailController.text)),
                                      );
                                    }
                                  },
                                ),
                                controller: _emailController,
                                theme: _theme),
                            ProfileTextField(
                                suffixWidget: BlocConsumer<EditmobileBloc,
                                    EditmobileState>(
                                  listener: (context, state) {
                                    if (state is EditMobilesuccess) {
                                      buildSuccessMessage();
                                    } else if (state is EditMobileFaild) {
                                      buildErrorMessage(state.message);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is EditMobileLoading) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: KdefaultPadding),
                                        child: SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      return SuffixTextButton(
                                        onPressed: () =>
                                            BlocProvider.of<EditmobileBloc>(
                                                    context)
                                                .add(EditMobile(
                                                    _mobileController.text)),
                                      );
                                    }
                                  },
                                ),
                                controller: _mobileController,
                                theme: _theme),
                            ProfileTextField(
                                suffixWidget: buildFirstNameInitial(context),
                                enabled: false,
                                controller: _passwordController,
                                theme: _theme),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  void buildSuccessMessage() {
    showToastWidget(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.greenAccent,
              size: 30,
            ),
            Text(
              AppLocalizations.of(context).translate("edited_successfully"),
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
        context: context,
        position: StyledToastPosition.center,
        dismissOtherToast: true,
        isHideKeyboard: true,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        duration: Duration(seconds: 4),
        animDuration: Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear);
  }

  void buildErrorMessage(String message) {
    showToastWidget(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: KErrorColor,
              size: 30,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
        context: context,
        position: StyledToastPosition.center,
        dismissOtherToast: true,
        isHideKeyboard: true,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        duration: Duration(seconds: 4),
        animDuration: Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear);
  }

  SuffixTextButton buildFirstNameInitial(BuildContext context) {
    return SuffixTextButton(
      onPressed: () => BlocProvider.of<EditfirstnameBloc>(context)
          .add(EditFirstName(_firstNameController.text)),
    );
  }
}

class SuffixTextButton extends StatelessWidget {
  const SuffixTextButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    AppLocalizations _translator = AppLocalizations.of(context);
    ThemeData _theme = Theme.of(context);

    return TextButton(
        onPressed: onPressed,
        child: Text(
          _translator.translate("update"),
          style: _theme.textTheme.button.copyWith(fontSize: 12),
        ));
  }
}
