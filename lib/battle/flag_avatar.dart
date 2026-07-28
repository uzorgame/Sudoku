import 'dart:math' as math;

import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

const String kFallbackFlagEmoji = '⚪️';

class FlagAvatar extends StatelessWidget {
  final String? countryCode;
  final String fallbackEmoji;
  final Color backgroundColor;

  const FlagAvatar({
    super.key,
    this.countryCode,
    this.fallbackEmoji = kFallbackFlagEmoji,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dimension = _resolveDimension(constraints);
        final flagSize = dimension.isFinite && dimension > 0 ? dimension : 48.0;

        Widget content;
        final code = countryCode;
        if (code != null && code.isNotEmpty) {
          content = FittedBox(
            fit: BoxFit.cover,
            child: CircleFlag(
              code.toLowerCase(),
              size: flagSize,
            ),
          );
        } else {
          content = Center(
            child: Text(
              fallbackEmoji,
              style: TextStyle(fontSize: flagSize * 0.6),
            ),
          );
        }

        return ClipOval(
          child: ColoredBox(
            color: backgroundColor,
            child: SizedBox.expand(child: content),
          ),
        );
      },
    );
  }
}

double _resolveDimension(BoxConstraints constraints) {
  final hasBoundedWidth = constraints.hasBoundedWidth && constraints.maxWidth.isFinite;
  final hasBoundedHeight = constraints.hasBoundedHeight && constraints.maxHeight.isFinite;

  if (hasBoundedWidth && hasBoundedHeight) {
    return math.min(constraints.maxWidth, constraints.maxHeight);
  }
  if (hasBoundedWidth) {
    return constraints.maxWidth;
  }
  if (hasBoundedHeight) {
    return constraints.maxHeight;
  }
  return 48.0;
}
