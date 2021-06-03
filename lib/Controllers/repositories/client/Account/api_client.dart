import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:techtime/Controllers/repositories/Auth/repository.dart';
import 'package:techtime/Helpers/APIUrls.dart';
import 'package:techtime/Helpers/network_constents.dart';
import 'package:techtime/Helpers/shared_perfs_provider.dart';

class AccountApiClient {
  final PreferenceUtils prefs;
  final AuthRepo _authRepo = AuthRepo();

  AccountApiClient({
    @required this.prefs,
  }) : assert(prefs != null);
  Future getProfileData() async {
    final String _path = KAPIURL + NetworkConstants.userProfileAPI;

    try {
      var resp = await http.post(Uri.parse(_path),
          headers: {"Authorization": "Token $currentToken"});
      final decoded = utf8.decode(resp.bodyBytes);
      print(
          "[Login User] status message: #${resp.statusCode}, status code: #${resp.statusCode}");
      if (resp.statusCode == 200) {
        return decoded;
      } else {
        print(
            "[Login User] status message: #${resp.statusCode}, status code: #${resp.statusCode}");
        final data = resp.body;
        return Future.error(data);
      }
    } catch (e) {
      if (e.response != null) {
      } else {}
      return Future.error("error");
    }
  }

  Future<bool> editFirstName(String name) async {
    final String _path = KAPIURL + NetworkConstants.editFirstName;

    try {
      var resp = await http.post(Uri.parse(_path), body: {
        "first_name": name,
        "LanguageCode": _authRepo.currentLanguageCode
      }, headers: {
        "Authorization": "Token $currentToken"
      });
      final respData = json.decode(utf8.decode(resp.bodyBytes));
      if (respData["status"] == 201) {
        return true;
      } else {
        print(
            "[Edit User FirstName] status message: #${respData["status"]}, status code: #${respData["message"]}");
        return Future.error(
            json.decode(utf8.decode(resp.bodyBytes))['message']);
      }
    } catch (e) {
      return Future.error(json.decode(utf8.decode(e.bodyBytes))['message']);
    }
  }

  Future<bool> editSecondName(String name) async {
    final String _path = KAPIURL + NetworkConstants.editLastName;

    try {
      var resp = await http.post(Uri.parse(_path), body: {
        "last_name": name,
        "LanguageCode": _authRepo.currentLanguageCode
      }, headers: {
        "Authorization": "Token $currentToken"
      });
      final respData = json.decode(utf8.decode(resp.bodyBytes));
      if (respData["status"] == 201) {
        print("First Name has been edited $respData");
        return true;
      } else {
        print(
            "[Edit User FirstName] status message: #${respData["status"]}, status code: #${respData["message"]}");
        return Future.error(
            json.decode(utf8.decode(resp.bodyBytes))['message']);
      }
    } catch (e) {
      return Future.error(json.decode(utf8.decode(e.bodyBytes))['message']);
    }
  }

  Future<bool> editEmailAddress(String email) async {
    final String _path = KAPIURL + NetworkConstants.editEmailAddress;

    try {
      var resp = await http.post(Uri.parse(_path),
          body: {"email": email, "LanguageCode": _authRepo.currentLanguageCode},
          headers: {"Authorization": "Token $currentToken"});
      final respData = json.decode(utf8.decode(resp.bodyBytes));
      if (respData["status"] == 201) {
        print("First Name has been edited $respData");
        return true;
      } else {
        print(
            "[Edit User FirstName] status message: #${respData["status"]}, status code: #${respData["message"]}");
        return Future.error(
            json.decode(utf8.decode(resp.bodyBytes))['message']);
      }
    } catch (e) {
      return Future.error(json.decode(utf8.decode(e.bodyBytes))['message']);
    }
  }

  Future<bool> editMobile(String mobile) async {
    final String _path = KAPIURL + NetworkConstants.editMobile;

    try {
      var resp = await http.post(Uri.parse(_path), body: {
        "mobile": mobile,
        "LanguageCode": _authRepo.currentLanguageCode
      }, headers: {
        "Authorization": "Token $currentToken"
      });
      final respData = json.decode(utf8.decode(resp.bodyBytes));
      if (respData["status"] == 201) {
        print("First Name has been edited $respData");
        return true;
      } else {
        print(
            "[Edit User FirstName] status message: #${respData["status"]}, status code: #${respData["message"]}");
        return Future.error(
            json.decode(utf8.decode(resp.bodyBytes))['message']);
      }
    } catch (e) {
      return Future.error(json.decode(utf8.decode(e.bodyBytes))['message']);
    }
  }

  Future uploadProfilePicture(File imageFile) async {
    bool hasBeenUploaded;
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    final String _path = KAPIURL + NetworkConstants.uploadProfilePicture;

    // string to uri
    var uri = Uri.parse(_path);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll({"Authorization": "Token $currentToken"});

    // multipart that takes file
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      if (json.decode(value)['status'] == 201) {
        hasBeenUploaded = true;
      } else {
        hasBeenUploaded = false;
      }
      return hasBeenUploaded;
    });
    return true;
  }

  uploadCover(File imageFile) async {
    print("Start Uploading Image File");
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    final String _path = KAPIURL + NetworkConstants.uploadCoverPicture;

    // string to uri
    var uri = Uri.parse(_path);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll({"Authorization": "Token $currentToken"});

    // multipart that takes file
    var multipartFile = new http.MultipartFile('CoverImage', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.toString());

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  void logOut() {}
  String get currentToken {
    return _authRepo.currentUserToken;
  }
}
