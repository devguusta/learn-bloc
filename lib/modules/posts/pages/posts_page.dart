import 'package:blocjson/modules/home/pages/home_bloc.dart';
import 'package:blocjson/modules/posts/pages/posts_bloc.dart';
import 'package:blocjson/modules/posts/pages/posts_event.dart';
import 'package:blocjson/modules/posts/pages/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostsBloc, PostsState>(
          bloc: Modular.get<PostsBloc>(),
          builder: (context, state) {
            if (state is PostsStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsStateSuccess) {
              return ListView.builder(
                  itemCount: state.listPost.length - 90,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.listPost[index].title),
                    );
                  });
            } else {
              return const Center(child: Text("Não deu"));
            }
          }),
    );
  }
}
