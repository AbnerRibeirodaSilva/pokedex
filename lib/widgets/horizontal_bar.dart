import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final String label;
  final int currentValue;
  final int maxValue;
  final Color backgroundColor;
  final Color foregroundColor;

  const HorizontalBar({
    Key key,
    this.label,
    this.currentValue = 0,
    this.maxValue = 300,
    this.backgroundColor = Colors.black12,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                _buildBar(color: backgroundColor, percent: 1.0),
                _buildBar(
                    color: foregroundColor, percent: currentValue / maxValue),
                _buildTextBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBar({Color color, double percent}) {
    return FractionallySizedBox(
      widthFactor: percent,
      child: Container(
        height: 22,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  _buildTextBar() {
    return Center(
      child: Text(
        '$currentValue / $maxValue',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
