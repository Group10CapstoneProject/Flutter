import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: (backgroundColor != null) ? backgroundColor : Colors.black54,
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF7DC8C4),
        ),
      ),
    );
  }
}