import 'package:flutter/material.dart';
import 'package:post_http_demo/main.dart';
import 'package:post_http_demo/services/http_requests.dart';
import '../models/album_model.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

List arr = [];

class _GetDataState extends State<GetData> {
  Future<List>? newAlbum;

  @override
  void initState() {
    super.initState();
    newAlbum = HttpServices().getAlbum(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: newAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print('${snapshot.data}');
              arr.addAll(snapshot.data!);
              //print(arr);
              return ListView.builder(
                  itemCount: arr.length,
                  itemBuilder: (context, index) => tile(
                        context,
                        id: arr[index]['id'],
                        title: arr[index]['title'],
                      ));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Widget tile(
  context, {
  int? id,
  String title = '',
}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("ID: $id"),
      Text("Title: $title"),
    ]),
  );
}
