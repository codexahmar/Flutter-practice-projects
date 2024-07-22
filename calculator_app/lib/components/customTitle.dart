import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final TextStyle textStyle;
  final IconThemeData? iconTheme;
  const CustomTitle({
    Key? key,
    required this.text,
  this.iconTheme,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold,),
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: const Color(0xff313131),
        iconTheme: iconTheme ?? const IconThemeData(),
        title: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
