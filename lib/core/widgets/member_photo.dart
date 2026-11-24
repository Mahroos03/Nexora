import 'package:flutter/material.dart';

/// Round profile photo. Accepts an asset path or an http(s) URL.
/// Falls back to initials if the image is missing or fails to load.
class MemberPhoto extends StatelessWidget {
  final String name;
  final String imagePath;
  final double size;
  final double borderWidth;
  final Color borderColor;

  const MemberPhoto({
    super.key,
    required this.name,
    required this.imagePath,
    this.size = 72,
    this.borderWidth = 2,
    this.borderColor = const Color(0x334F46E5),
  });

  String get _initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts[1][0]).toUpperCase();
  }

  Widget _fallback() {
    return Container(
      color: const Color(0xFFEEF2FF),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: TextStyle(
          color: const Color(0xFF4F46E5),
          fontWeight: FontWeight.bold,
          fontSize: size * 0.32,
        ),
      ),
    );
  }

  Widget _image() {
    if (imagePath.isEmpty) return _fallback();

    if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (_, _, _) => _fallback(),
        loadingBuilder: (context, child, progress) =>
            progress == null ? child : _fallback(),
      );
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (_, _, _) => _fallback(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(shape: BoxShape.circle, color: borderColor),
      child: ClipOval(child: _image()),
    );
  }
}
