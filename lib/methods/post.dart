import 'package:flutter/material.dart';
import 'package:post_http_demo/models/album_model.dart';
import 'package:post_http_demo/services/http_requests.dart';

import '../main.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  State<PostData> createState() => _PostState();
}

class _PostState extends State<PostData> {
  final TextEditingController titleController = TextEditingController();

  Future<Album>? newAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PostData Method"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: (newAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return (Column(children: [
      TextField(
        keyboardType: TextInputType.name,
        controller: titleController,
        decoration: const InputDecoration(hintText: "Enter Title"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            newAlbum = HttpServices()
                .createAlbum(title: titleController.text, urlServices: url);
          });
        },
        child: const Text("Create"),
      )
    ]));
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: newAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print(snapshot.data!.id);
          return (Text(
            snapshot.data!.title,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
