import 'package:bloc_learn/cubit/posts/post_apis_cubit.dart';
import 'package:bloc_learn/cubit/posts/post_apis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';

class PostShow extends StatelessWidget {
  const PostShow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostApisCubit(),
      child: Scaffold(
        body: BlocBuilder<PostApisCubit, PostApisState>(
          builder: (context, state) {
            if (state is PostApisError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is PostApisList) {
              return commonPostListShow(posts: state.post);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget commonPostListShow({required List<PostModel> posts}) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        return ListTile(
          leading: Text(post.id.toString()),
          title: Text(post.title.toString()),
          subtitle: Text(post.body.toString()),
        );
      },
    );
  }
}
