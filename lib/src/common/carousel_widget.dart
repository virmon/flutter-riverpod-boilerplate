import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Widget> children;

  const Carousel({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        children: children,
      ),
    );
  }
}
