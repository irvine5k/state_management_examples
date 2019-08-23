import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiagonallyImage extends StatelessWidget {
  final Widget hero;
  DiagonallyImage({Key key, this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: hero,
      clipper: MyClipper(),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 70);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
