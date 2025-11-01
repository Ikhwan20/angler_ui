import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  final String text;
  final String imageUrl;

  const CustomTabItem({super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imageUrl,
          height: 20,
          width: 20,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.image_not_supported,
              size: 20,
              color: Colors.grey,
            );
          },
        ),
        const SizedBox(height: 3),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
