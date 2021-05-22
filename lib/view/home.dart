import 'package:crud_jsonplaceholder/provider/general_provider.dart';
import 'package:crud_jsonplaceholder/provider/post_provider.dart';
import 'package:crud_jsonplaceholder/view/add_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Consumer(builder: (context, watch, child) {
        final posts = watch(postProvide);
        return posts.when(
          data: (data) => ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              for (var item in data)
                ListTile(
                  title: Text(item.title.toString()),
                  subtitle: Text(item.body.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPost(
                                type: true,
                                data: item,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read(dataService)
                              .deletePost(item.id)
                              .then((value) {
                            if (value == false) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Response'),
                                  content: const Text('Someting Wrong!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Response'),
                                        content: const Text(
                                            'Data anda berhasil di hapus'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .refresh(postProvide.notifier)
                                                  .getReadPost();
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ));
                            }
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
            ],
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, st) => Center(
            child: Text('$e'),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPost(type: false)),
          );
        },
      ),
    );
  }
}
