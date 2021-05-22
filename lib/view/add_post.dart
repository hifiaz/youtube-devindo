import 'package:crud_jsonplaceholder/model/post_model.dart';
import 'package:crud_jsonplaceholder/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPost extends StatefulWidget {
  final bool type;
  final PostModel? data;

  const AddPost({Key? key, required this.type, this.data}) : super(key: key);
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController title = TextEditingController();
  late TextEditingController body = TextEditingController();

  @override
  void initState() {
    setState(() {
      title = TextEditingController(text: widget.data!.title);
      body = TextEditingController(text: widget.data!.body);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: body,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Body',
              ),
            ),
            SizedBox(height: 10),
            widget.type == true
                ? TextButton(
                    onPressed: () {
                      context
                          .read(postProvide.notifier)
                          .editReadPost(PostModel(
                            title: title.text,
                            body: body.text,
                            userId: widget.data!.userId,
                            id: widget.data!.id,
                          ))
                          .then((value) {
                        if (value == true) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Response'),
                                    content: const Text('Berhasil di Edit'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            title.clear();
                                            body.clear();
                                          });
                                          context
                                              .refresh(postProvide.notifier)
                                              .getReadPost();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ));
                        } else {
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
                                  ));
                        }
                      });
                    },
                    child: Text('Edit'),
                  )
                : TextButton(
                    onPressed: () {
                      context
                          .read(postProvide.notifier)
                          .createReadPost(PostModel(
                              title: title.text, body: body.text, userId: 1))
                          .then((value) {
                        if (value == true) {}
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Response'),
                                  content: const Text('Berhasil di simpan'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          title.clear();
                                          body.clear();
                                        });
                                        context
                                            .refresh(postProvide.notifier)
                                            .getReadPost();
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      });
                    },
                    child: Text('Save'),
                  )
          ],
        ),
      ),
    );
  }
}
