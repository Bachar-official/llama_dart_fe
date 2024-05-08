import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/think.png'),
        const Positioned(
          top: -5,
          right: -5,
          child: CircularProgressIndicator(color: Colors.deepOrange),
        ),
      ],
    );
  }
}
