import 'package:bloc/bloc.dart';
import 'package:bloc_learn/data/model/post_model.dart';
import 'package:bloc_learn/data/repositery/post_repositery.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'post_apis_state.dart';

class PostApisCubit extends Cubit<PostApisState> {
  PostApisCubit() : super(PostApisInitial()) {
    fetchPostsList();
  }

  PostRepository postRepository = PostRepository();

  fetchPostsList() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostApisList(post: posts));
    } on DioException catch (e) {
      emit(PostApisError(error: e.message.toString()));
    } catch (e) {
      emit(PostApisError(error: e.toString()));
    }
  }
}
