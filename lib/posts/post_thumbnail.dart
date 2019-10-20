import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imagePath;

  const PostImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Ink.image(
        image: AssetImage(this.imagePath),
        width: 70.0,
        height: 70.0,
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
  }
}
