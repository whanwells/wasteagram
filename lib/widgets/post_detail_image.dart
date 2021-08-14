import 'package:flutter/material.dart';

class PostDetailImage extends StatelessWidget {
  final String url;

  const PostDetailImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return Semantics(
            child: child,
            label: 'Image of wasted items.',
          );
        }

        return CircularProgressIndicator(semanticsLabel: 'Image loading');
      },
    );
  }
}
