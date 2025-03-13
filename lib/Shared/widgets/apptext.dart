import 'package:flutter/material.dart';

// Define individual classes for different text styles
// HeadingText
// TitleText
// SubtitleText
// ParagraphText
// CaptionText
// BodyText

// Heading Text Style
class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final bool? isWhite;

  const HeadingText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.maxLines,
      this.color,
      this.isWhite});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.white,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// Title Text Style
class TitleText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? size;
  final Color? color;

  const TitleText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// Subtitle Text Style
class SubtitleText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final double? size;

  const SubtitleText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.maxLines,
      this.color,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.grey[400],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.clip,
      softWrap: true,
    );
  }
}

// Paragraph Text Style
class ParagraphText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  const ParagraphText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black,
        height: 1.5, // Line height for readability
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// Caption Text Style
class CaptionText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  const CaptionText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.grey,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// Body Text Style (Default Style)
class BodyText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  const BodyText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
