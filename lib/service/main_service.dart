import 'package:dio/dio.dart';
import 'package:github/models/repository.model.dart';
import 'package:github/utils/utils.dart';

final options = BaseOptions(
  baseUrl: "https://api.github.com/users",
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);

class ProjectService {
  static final Dio _dio = Dio(options);

  Future<List<GithubRepo>?> fetchProjects({
    required String username,
    required String page,
  }) async {
    try {
      final response = await _dio.get('/$username/repos', queryParameters: {'page': page});
      
      if (response.data != null) {
        logThis('this are the fetched transactions successful');
        return (response.data as List<dynamic>)
            .map(
                (doc) => GithubRepo.fromJson(doc as Map<String, dynamic>))
            .toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      logThis("Dio error: ${e.message}");
      return null;
    } catch (e) {
      logThis("Unexpected error: $e");
      return null;
    }
  }
}
