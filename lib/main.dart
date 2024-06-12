import 'package:bloc_learn/cubit/internet/internet_cubit.dart';
import 'package:bloc_learn/data/repositery/post_repositery.dart';
import 'package:bloc_learn/email_valid.dart';
import 'package:bloc_learn/screens/posts/posts_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/email_validat_bolc/email_validate_bloc.dart';

void main() {
  PostRepository postRepository = PostRepository();
  postRepository.getPosts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PostShow(),
    );
  }
}

class InternetUiPage extends StatelessWidget {
  const InternetUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetCubit, InternetCubitState>(
        listener: (context, state) {
          if (state == InternetCubitState.gained) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Internet Gained.. !")));
          } else if (state == InternetCubitState.lost) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: const Text("Internet Lost !")));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: const Text("Loading...!")));
          }
        },
        builder: (context, state) {
          if (state == InternetCubitState.gained) {
            return const Text("Internet Connected !");
          } else if (state == InternetCubitState.lost) {
            return const Text("Internet Lost !");
          } else {
            return const Text("Loading...!");
          }
        },
      )),
    );
  }
}
