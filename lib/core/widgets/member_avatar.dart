import 'package:flutter/material.dart';

/// A robust avatar widget that displays a stylish member portrait.
/// If an image fails to load or the app is offline, it gracefully falls back
/// to an artistic gradient avatar with the member's stylized initials.
class MemberAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final double radius;
  final List<Color> gradientColors;
  final Color borderColor;
  final double borderWidth;
  final IconData? fallbackIcon;

  const MemberAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 45,
    this.gradientColors = const [Color(0xFF4F46E5), Color(0xFF06B6D4)],
    this.borderColor = Colors.white,
    this.borderWidth = 3,
    this.fallbackIcon,
  });

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0].substring(0, parts[0].length >= 2 ? 2 : 1).toUpperCase();
    }
    return 'NX';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallback();
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return _buildFallback();
                },
              )
            : _buildFallback(),
      ),
    );
  }

  Widget _buildFallback() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: fallbackIcon != null
            ? Icon(fallbackIcon, size: radius * 0.9, color: Colors.white)
            : Text(
                _initials,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: radius * 0.65,
                  letterSpacing: 1,
                ),
              ),
      ),
    );
  }
}
