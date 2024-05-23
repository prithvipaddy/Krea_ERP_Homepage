import 'package:flutter/material.dart';

class TextEntryBox extends StatelessWidget {
  const TextEntryBox({
    super.key,
    required this.boxName,
    required this.requiredBox,
  });
  final String boxName;
  final bool requiredBox;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
