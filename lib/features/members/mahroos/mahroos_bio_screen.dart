import 'package:flutter/material.dart';
import '../../../core/models/member_model.dart';
import '../../../core/state/favorites_manager.dart';
import '../../../core/widgets/member_avatar.dart';

/// Design Style 1: Cyber-Tech Dark Slate Architecture
/// Distinctive features: Custom sliver header, diagonal ClipPath,
/// dark mode neon highlights, metric counter row, glowing timeline nodes,
/// and reactive endorsement counter.
class MahroosBioScreen extends StatefulWidget {
  const MahroosBioScreen({super.key});

  @override
  State<MahroosBioScreen> createState() => _MahroosBioScreenState();
}

class _MahroosBioScreenState extends State<MahroosBioScreen> {
  final MemberData member = NexoraMembers.getById(1);
  final FavoritesManager _favManager = FavoritesManager();
  bool _isLiked = false;

  static const Color bgDark = Color(0xFF0A0F1D);
  static const Color cardDark = Color(0xFF141D30);
  static const Color cardDarkElevated = Color(0xFF1E2B45);
  static const Color cyanAccent = Color(0xFF38BDF8);
  static const Color indigoAccent = Color(0xFF818CF8);

  @override
  void initState() {
    super.initState();
    _isLiked = _favManager.isFavorite(member.id);
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _favManager.incrementEndorsement(member.id);
      }
      _favManager.toggleFavorite(member.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isLiked ? 'Endorsed ${member.fullName}!' : 'Removed endorsement',
        ),
        backgroundColor: cyanAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: CustomScrollView(
        slivers: [
          // Cyber Tech Hero Header with Back button and Endorse action
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: bgDark,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? const Color(0xFFF43F5E) : Colors.white70,
                ),
                onPressed: _toggleLike,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Diagonal angled tech gradient banner
                  ClipPath(
                    clipper: _TechDiagonalClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E1B4B), Color(0xFF0369A1), Color(0xFF0F766E)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        MemberAvatar(
                          name: member.fullName,
                          imageUrl: member.avatarUrl,
                          radius: 46,
                          borderWidth: 3,
                          borderColor: cyanAccent,
                          gradientColors: const [Color(0xFF38BDF8), Color(0xFF4F46E5)],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                member.fullName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                member.role,
                                style: const TextStyle(
                                  color: cyanAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: indigoAccent.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: indigoAccent.withValues(alpha: 0.4)),
                                ),
                                child: const Text(
                                  'Team Nexora / Lead',
                                  style: TextStyle(
                                    color: indigoAccent,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Live Stats Row
                  ListenableBuilder(
                    listenable: _favManager,
                    builder: (context, _) {
                      return Row(
                        children: [
                          _buildStatCard('Endorsements', '${_favManager.getEndorsementCount(member.id)}', Icons.bolt, cyanAccent),
                          const SizedBox(width: 10),
                          _buildStatCard('Qualifications', '${member.qualifications.length}', Icons.school, indigoAccent),
                          const SizedBox(width: 10),
                          _buildStatCard('Soft Skills', '${member.softSkills.length}', Icons.psychology, const Color(0xFF10B981)),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Contact & Location Card (MANDATORY REQUIREMENT: Address & Email)
                  _buildSectionHeader('CONTACT & LOCATION', Icons.alternate_email),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Column(
                      children: [
                        _buildContactRow(Icons.email_outlined, 'Email Address', member.email, cyanAccent),
                        const Divider(color: Colors.white10, height: 20),
                        _buildContactRow(Icons.location_on_outlined, 'Residential Address', member.address, indigoAccent),
                        const Divider(color: Colors.white10, height: 20),
                        _buildContactRow(Icons.phone_outlined, 'Phone', member.phone, const Color(0xFF10B981)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // About Bio
                  _buildSectionHeader('EXECUTIVE SUMMARY', Icons.badge_outlined),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Text(
                      member.bio,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Academic Qualifications Timeline (MANDATORY: O/L, A/L, Certificates, Diplomas)
                  _buildSectionHeader('ACADEMIC QUALIFICATIONS', Icons.history_edu),
                  ...member.qualifications.map((q) => _buildTimelineItem(q)),

                  const SizedBox(height: 24),

                  // Soft Skills Matrix (MANDATORY)
                  _buildSectionHeader('SOFT SKILLS MATRIX', Icons.people_outline),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: member.softSkills.map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: cardDarkElevated,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: cyanAccent.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle_outline, size: 14, color: cyanAccent),
                            const SizedBox(width: 6),
                            Text(
                              skill,
                              style: const TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Special Talents (MANDATORY)
                  _buildSectionHeader('SPECIAL TALENTS & INTERESTS', Icons.stars),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Column(
                      children: member.specialTalents.map((talent) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: indigoAccent.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.star_rounded, size: 16, color: indigoAccent),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  talent,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Endorse Button (State Management)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _toggleLike,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isLiked ? const Color(0xFFF43F5E) : cyanAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      icon: Icon(_isLiked ? Icons.favorite : Icons.thumb_up_alt_outlined),
                      label: Text(
                        _isLiked ? 'Endorsed (Tap to Undo)' : 'Endorse Mahroos',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: cyanAccent),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: cardDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem(QualificationItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: indigoAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.school, size: 20, color: indigoAccent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: cyanAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.year,
                        style: const TextStyle(color: cyanAccent, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.institution,
                  style: const TextStyle(color: cyanAccent, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  item.details,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TechDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
