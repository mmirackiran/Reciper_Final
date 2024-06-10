
class ParsedText {
  final String text;
  final TextType type;

  ParsedText({required this.text, required this.type});
}

enum TextType {
  normal("normal"),
  bold("bold");

  final String value;

  const TextType(this.value);
}
