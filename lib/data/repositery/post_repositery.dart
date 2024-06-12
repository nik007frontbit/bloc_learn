import 'package:bloc_learn/data/model/post_model.dart';
import 'package:bloc_learn/data/repositery/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  Api api = Api();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((e) => PostModel.fromJson(e)).toList();
      print(postMaps);
    } catch (e) {
      throw e;
    }
  }
   getPosts() async {
    try {

      Response response = await api.sendRequest.post("/posts",data: {
          "title": 'foo',
          "body": 'bajjjjjr',
          "userId": 1,
      },options: Options(
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }
      ));
      var postMaps = response.data;

    } catch (e) {
      throw e;
    }
  }
}
