import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
        "https://i.pinimg.com/564x/90/f1/47/90f1478ca33cc9c9131a885f15eae8f6.jpg");
  }
}
