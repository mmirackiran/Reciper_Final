import 'package:flutter/material.dart';

enum AskType {
  gallery("Gallery", Icons.image),
  name("Name", Icons.text_format),
  camera("Camera", Icons.camera_alt_rounded);

  final String value;
  final IconData icon;
  const AskType(this.value, this.icon);
}
