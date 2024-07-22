import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final VoidCallback onPress;
  final bool isWide;
  final bool isVertical;
  const MyButton({
    super.key,
    required this.text,
    this.color = const Color(0xff505050),
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 30),
    required this.onPress,
    this.isWide = false,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isWide ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: isWide ? BoxShape.rectangle : BoxShape.circle,
              color: color,
              borderRadius: isWide ? BorderRadius.circular(40) : null,
            ),
            child: Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
