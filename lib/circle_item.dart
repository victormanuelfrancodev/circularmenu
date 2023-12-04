import 'package:flutter/material.dart';

class CircleItem extends StatelessWidget {
  const CircleItem(
      { required this.size,
        required this.color,
        this.titleStyle = const TextStyle(color: Colors.black),
        this.borderColor,
        this.borderWidth,
        this.title,
        this.imageName,
        required this.onTap,
        super.key});

  final double size;
  final Color color;
  final TextStyle titleStyle;
  final String? title;
  final String? imageName;
  final VoidCallback onTap;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0),
          color: color,
          borderRadius: BorderRadius.circular((size) / 2),
        ),
        child: ClipOval(
            child: this.imageName != null
                ? Image.asset(
              this.imageName!,
              fit: BoxFit.cover,
            )
                : Center(child: Text(title != null ? title! : "", style: titleStyle,),)
        ),
      ),
    );
  }
}
