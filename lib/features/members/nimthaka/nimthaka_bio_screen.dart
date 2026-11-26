import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/models/member_model.dart';
import '../../../core/state/favorites_manager.dart';
/// Design Style: Cobalt Blueprint & Architectural Dossier
/// Distinctive features: Blueprint grid split-hero with chamfered portrait frame,
/// interactive tap-to-copy contact cards with copied state, segmented section
/// filter bar, interactive project deck inspector with list-all toggle,
/// skill-domain distribution bars, and vertical timeline experience layout.
class NimthakaBioScreen extends StatefulWidget {
  const NimthakaBioScreen({super.key});
  @override
  State<NimthakaBioScreen> createState() => _NimthakaBioScreenState();
}
class _CvProject {
  final String code;
  final String title;
  final String shortLabel;
  final String year;
  final String subtitle;
  final IconData icon;
  final List<String> stack;
  final List<String> bullets;
  const _CvProject({
    required this.code,
    required this.title,
    required this.shortLabel,
    required this.year,
    required this.subtitle,
    required this.icon,
    required this.stack,
    required this.bullets,
  });
}
class _CvEducation {
  final String program;
  final String institution;
  final String period;
  final String country;
  const _CvEducation({
    required this.program,
    required this.institution,
    required this.period,
