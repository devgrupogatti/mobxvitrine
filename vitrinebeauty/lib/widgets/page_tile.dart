import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  //const SlideTile({Key? key}) : super(key: key);
  final String image;
  final bool activePage;

  const SlideTile({Key? key, required this.image, required this.activePage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double top = activePage ? 50 : 150;
    final double blur = activePage ? 30 : 0;
    final double offset = activePage ? 20 : 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(
        top: top,
        bottom: 100,
        right: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset))
        ],
      ),
    );
  }
}
