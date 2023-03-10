import 'package:dio/dio.dart';

import '../model/home_model.dart';

class HomeRepositories {
  Future<List<HomeModel>> getDataFromApi() async {
    final response = await Dio().get("https://api.sampleapis.com/coffee/hot");

    final homeData = List<HomeModel>.from(
      response.data.map(
        (value) => HomeModel.fromJson(value),
      ),
    );

    return homeData;
  }
}
