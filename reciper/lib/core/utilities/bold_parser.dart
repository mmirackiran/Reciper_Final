import 'package:flutter/material.dart';
import 'package:reciper/model/parsed_text_model.dart';

class BoldParser {
  static List<ParsedText> parse(String text) {
    List<String> splittedText = text.split("**");
    return splittedText.map((e) {
      int index = splittedText.indexOf(e);
      if (index % 2 == 1) {
        return ParsedText(text: e, type: TextType.bold);
      } else {
        return ParsedText(text: e, type: TextType.normal);
      }
    }).toList();
  }

  static richText(String text, {TextStyle? style, bool isSelectable = false}) {
    final parsedTexts = parse(text);
    return isSelectable
        ? SelectableText.rich(
            TextSpan(
              children: parsedTexts.map((e) {
                if (e.type == TextType.bold) {
                  return TextSpan(
                    text: e.text,
                    style: style?.copyWith(fontWeight: FontWeight.bold),
                  );
                } else {
                  return TextSpan(text: e.text, style: style);
                }
              }).toList(),
            ),
          )
        : RichText(
            text: TextSpan(
              children: parsedTexts.map((e) {
                if (e.type == TextType.bold) {
                  return TextSpan(
                    text: e.text,
                    style: style?.copyWith(fontWeight: FontWeight.bold),
                  );
                } else {
                  return TextSpan(text: e.text, style: style);
                }
              }).toList(),
            ),
          );
  }
}
