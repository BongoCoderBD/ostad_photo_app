import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:ostad_photo_app/Models/models.dart';
import 'fullScreenPhoto.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final List photoList = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getPhotoFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo List"),
      ),
      body: Visibility(
        visible: inProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: photoList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _onTapPhoto(index);
            },
            child: buildListTile(photoList[index]),
          ),
        ),
      ),
    );
  }

// ListTile is here
  ListTile buildListTile(Photos photos) {
    return ListTile(
      title: Text(photos.title ?? ''),
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Image.network(
          photos.thumbnailUrl ?? '',
          width: MediaQuery.of(context).size.width / 4,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

// photo on Tap is here
  _onTapPhoto(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenPhoto(
          photos: photoList[index],
        ),
      ),
    );
  }

//getPhoto Api Call Here
  Future<void> getPhotoFromApi() async {
    inProgress = true;
    setState(() {});
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    Response response = await get(url);
    var statusCode = response.statusCode;
    var decodedData = jsonDecode(response.body);
    if (statusCode == 200) {
      for (var item in decodedData) {
        Photos photos = Photos.fromJson(item);
        photoList.add(photos);
       
      }
      
      setState(() {
        inProgress = false;
         ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Photo's loaded success!")));
      });
    }
  }
}
