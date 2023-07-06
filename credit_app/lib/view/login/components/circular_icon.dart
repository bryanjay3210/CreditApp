import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 210,
          ),
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
  }
}
