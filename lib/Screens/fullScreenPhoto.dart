import 'package:flutter/material.dart';
import '../Models/models.dart';

class FullScreenPhoto extends StatelessWidget {
  final Photos photos;

  const FullScreenPhoto({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                photos.url ?? '',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('ID: ${photos.id}'),
              const SizedBox(height: 10),
              Text("Title: ${photos.title ?? ''}"),
            ],
          ),
        ),
      ),
    );
  }
}
