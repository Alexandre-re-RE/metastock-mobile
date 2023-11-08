import 'package:flutter/material.dart';

class CustomWidgetBlackBackGround extends StatelessWidget {
  const CustomWidgetBlackBackGround({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
        child: widget);
  }
}
