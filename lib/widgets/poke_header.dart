import 'package:flutter/material.dart';

class PokeHeader extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;
  final double radius;

  const PokeHeader({
    Key key,
    this.imageUrl,
    this.backgroundColor,
    this.radius = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.5,
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.width * 0.15,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
              ),
            ),
          ),
          Container(
            height: size.width * 0.5,
            width: size.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
