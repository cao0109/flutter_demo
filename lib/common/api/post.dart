import 'package:get/get.dart';

class PostApi extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => map;
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';

    //添加请求拦截器 用于添加Authorization
    // httpClient.addRequestModifier<dynamic>((request) {
    //   request.headers['Authorization'] =
    //       'Bearer sk_test_yji0CXC8kVtJlmzMIHTtRSfhG7VT4raqIh4h3XPmd6';
    //   return request;
    // });
  }

  Future<Response> getPosts() => get('/posts');
  Future<Response> postPost(Map data) => post('/posts', data);
  Future<Response> deletePost(int id) => delete('/posts/$id');
}
