import 'dart:convert';
import 'package:techtime/Helpers/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:techtime/Models/client/advertise.dart';
import 'package:techtime/Models/client/category.dart';
import 'package:techtime/Models/client/company.dart';

abstract class ClientHomeRepository {
  Future<List<Category>> get fetchCategories;
  Future<List<Company>> get fetchRecommendedCo;
  Future<List<Advertise>> get fetchAdsAbove;
  Future<List<Company>> get fetchLeastCo;
}

class APIClientHomeRepository implements ClientHomeRepository {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };
  @override
  Future<List<Category>> get fetchCategories async {
    final response = await http.post(Uri.parse(KAPIURL + KHomeAllCategories),
        headers: headers);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);

      final data = json.decode(decoded) as List;
      return data.map((rawPost) {
        return Category.fromJson(rawPost as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('${json.decode(response.body)}');
    }
  }

  @override
  Future<List<Company>> get fetchRecommendedCo async {
    final response = await http.post(Uri.parse(KAPIURL + KHomeRecommendedCo),
        headers: headers);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final data = json.decode(decoded) as List;
      return data.map((rawPost) {
        return Company.fromJson(rawPost as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('${json.decode(response.body)}');
    }
  }

  @override
  Future<List<Advertise>> get fetchAdsAbove async {
    final response = await http.post(Uri.parse(KAPIURL + KHomeAdsAbove),
        body: {"RequestType": "API", "LanguageCode": "EN"});

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final data = json.decode(decoded) as List;
      return data.map((rawPost) {
        return Advertise.fromJson(rawPost as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('${json.decode(response.body)['message']}');
    }
  }

  @override
  Future<List<Company>> get fetchLeastCo async {
    final response =
        await http.post(Uri.parse(KAPIURL + KHomeLeastCo), headers: headers);

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final data = json.decode(decoded) as List;
      return data.map((rawPost) {
        return Company.fromJson(rawPost as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('${json.decode(response.body)}');
    }
  }
}
