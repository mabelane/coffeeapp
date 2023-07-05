import 'dart:ui';

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  const BlurEffect(
      {super.key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.height,
      this.width});
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.black.withOpacity(0.45),
                        ])),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
