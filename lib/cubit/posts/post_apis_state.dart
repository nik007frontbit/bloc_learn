part of 'post_apis_cubit.dart';

@immutable
sealed class PostApisState {}

final class PostApisInitial extends PostApisState {}

final class PostApisList extends PostApisState {
  final List<PostModel> post;

  PostApisList({required this.post});
}

final class PostApisError extends PostApisState {
  final String error;

  PostApisError({required this.error});
}
