import 'package:flutter/material.dart';

void main() => runApp(ImageFeedApp());

class ImageFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Feed')),
        body: ImageFeed(),
      ),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> dummyImages = List.generate(10, (index) =>
  'https://via.placeholder.com/150?text=Image ${index + 1}'
  );

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? PortraitImageFeed(images: dummyImages) : LandscapeImageFeed(images: dummyImages);
  }
}

class PortraitImageFeed extends StatelessWidget {
  final List<String> images;

  PortraitImageFeed({required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 150,
            alignment: Alignment.center,
            child: Image.network(images[index]),
          ),
        );
      },
    );
  }
}

class LandscapeImageFeed extends StatelessWidget {
  final List<String> images;

  LandscapeImageFeed({required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Minimum 2 items per row
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 150,
            alignment: Alignment.center,
            child: Image.network(images[index]),
          ),
        );
      },
    );
  }
}
