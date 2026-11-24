import 'package:flutter/material.dart';
import '../../../core/models/member_model.dart';
import '../../../core/state/favorites_manager.dart';
import '../../../core/widgets/member_avatar.dart';

/// Cyber-Tech Dark Slate profile, populated from Rukshan's CV.
class RukshanBioScreen extends StatefulWidget {
  const RukshanBioScreen({super.key});

  @override
  State<RukshanBioScreen> createState() => _RukshanBioScreenState();
}

// ---------- Simple data holders ----------
class _Edu {
  final String institution, program, location, period;
  const _Edu(this.institution, this.program, this.location, this.period);
}

class _Project {
  final String title, tech;
  final List<String> points;
  const _Project(this.title, this.tech, this.points);
}

class _Cert {
  final String title, issuer;
  const _Cert(this.title, this.issuer);
}

class _Ref {
  final String name, post, org, email, phone;
  const _Ref(this.name, this.post, this.org, this.email, this.phone);
}

class _RukshanBioScreenState extends State<RukshanBioScreen> {
  final MemberData member = NexoraMembers.getById(1);
  final FavoritesManager _favManager = FavoritesManager();
  bool _isLiked = false;

  // ---------- CV DATA ----------
  static const String _name = 'Rukshan Mohottige';
  static const String _role = 'Software Engineering';
  static const String _email = 'rukshanmohottige@gmail.com';
  static const String _phone = '+94 74 134 2646';
  static const String _address = 'Kandy, Sri Lanka';

  static const String _summary =
      'Information Technology student at the Institute of Technology, University of '
      'Moratuwa, with hands-on experience designing and building full-stack web '
      'applications, RESTful services, and database systems. Proficient in Java, '
      'Spring Boot, Python, PHP, Flutter, and MySQL, with practical project '
      'experience in cloud synchronization, IoT health monitoring, and AI/ML. '
      'Combines strong technical foundations with problem-solving abilities, '
      'adaptability, and teamwork.';

  static const List<_Edu> _education = [
    _Edu('Institute of Technology, University of Moratuwa',
        'Higher National Diploma in Information Technology', 'Homagama, Sri Lanka', '2023 – Present'),
    _Edu('Dharmaraja College', 'GCE Advanced Level', 'Kandy, Sri Lanka', '2022'),
  ];

  static const List<_Project> _projects = [
    _Project(
      'Sentinel Care: Smart Medical Wristband & Wearable Health System (Final Year Project)',
      'Python, Flutter, Firebase, IoT',
      [
        'Implemented a predictive analytics & risk-prediction module in Python to analyze vital parameters and trigger automated alerts.',
        'Developed an end-to-end wearable health monitoring system with cloud sync and real-time data handling using Firebase and Flutter.',
      ],
    ),
    _Project(
      'Employee Leave Management System',
      'Java, Spring Boot, MySQL, REST APIs, Postman',
      [
        'Built a scalable backend system using Java and Spring Boot to streamline employee leave requests, approvals, and records.',
        'Designed RESTful APIs, business logic, and database schemas in MySQL, tested comprehensively via Postman.',
      ],
    ),
    _Project(
      'Food Ordering Web Application',
      'PHP, MySQL, JavaScript, HTML, CSS',
      [
        'Developed a dynamic web-based food ordering platform featuring menu management, cart processing, and order tracking.',
        'Built responsive frontend interfaces with HTML, CSS, and JavaScript integrated with a PHP and MySQL backend for order persistence.',
      ],
    ),
  ];

  static const List<_Cert> _certs = [
    _Cert('AI/ML Engineer – Stage 1', 'Centre for Open and Distance Education, SLIIT'),
    _Cert('Getting Started with Docker', 'Simplilearn'),
    _Cert('JavaScript Essentials 1', 'Cisco Networking Academy'),
    _Cert('Fundamentals of Machine Learning and AI', 'Coursera'),
    _Cert('Python Essentials 1', 'Cisco Networking Academy'),
  ];

  static const Map<String, List<String>> _skills = {
    'Languages & Frameworks': ['Java', 'Python', 'PHP', 'JavaScript', 'Spring Boot', 'Flutter', 'React', 'HTML/CSS'],
    'Databases, Cloud & Architecture': ['MySQL', 'Firebase', 'REST APIs'],
    'Tools & Platforms': ['Docker', 'Git', 'GitHub', 'Postman', 'MySQL Workbench', 'VS Code', 'IntelliJ IDEA', 'Google Colab'],
  };

  static const List<String> _softSkills = [
    'Problem Solving',
    'Teamwork & Collaboration',
    'Adaptability',
    'Clear Communication',
  ];

  static const List<_Ref> _refs = [
    _Ref('Mrs. Uthpala Athukorala', 'Senior Lecturer', 'Institute of Technology, UoM',
        'uthpalap@itum.mrt.ac.lk', '+94 77 266 6602'),
    _Ref('Mrs. Shashika Ruwanmini', 'Senior Lecturer', 'Institute of Technology, UoM',
        'ruwanminis@itum.mrt.ac.lk', '+94 77 855 8303'),
  ];

  // ---------- THEME ----------
  static const Color bgDark = Color(0xFF0A0F1D);
  static const Color cardDark = Color(0xFF141D30);
  static const Color cardDarkElevated = Color(0xFF1E2B45);
  static const Color cyanAccent = Color(0xFF38BDF8);
  static const Color indigoAccent = Color(0xFF818CF8);
  static const Color greenAccent = Color(0xFF10B981);

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
        content: Text(_isLiked ? 'Endorsed $_name!' : 'Removed endorsement'),
        backgroundColor: cyanAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: CustomScrollView(
        slivers: [
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
                          name: _name,
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
                              const Text(
                                _name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                _role,
                                style: TextStyle(color: cyanAccent, fontSize: 12, fontWeight: FontWeight.w500),
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
                                  'HNDIT · University of Moratuwa',
                                  style: TextStyle(color: indigoAccent, fontSize: 10, fontWeight: FontWeight.w600),
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

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Live stats
                  ListenableBuilder(
                    listenable: _favManager,
                    builder: (context, _) {
                      return Row(
                        children: [
                          _buildStatCard('Endorsements', '${_favManager.getEndorsementCount(member.id)}', Icons.bolt, cyanAccent),
                          const SizedBox(width: 10),
                          _buildStatCard('Projects', '${_projects.length}', Icons.code, indigoAccent),
                          const SizedBox(width: 10),
                          _buildStatCard('Certifications', '${_certs.length}', Icons.verified, greenAccent),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Contact
                  _buildSectionHeader('CONTACT & LOCATION', Icons.alternate_email),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: _cardDecoration,
                    child: Column(
                      children: [
                        _buildContactRow(Icons.email_outlined, 'Email Address', _email, cyanAccent),
                        const Divider(color: Colors.white10, height: 20),
                        _buildContactRow(Icons.location_on_outlined, 'Location', _address, indigoAccent),
                        const Divider(color: Colors.white10, height: 20),
                        _buildContactRow(Icons.phone_outlined, 'Phone', _phone, greenAccent),
                        const Divider(color: Colors.white10, height: 20),
                        _buildContactRow(Icons.link, 'Profiles', 'LinkedIn | GitHub', cyanAccent),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Summary
                  _buildSectionHeader('PROFESSIONAL SUMMARY', Icons.badge_outlined),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: _cardDecoration,
                    child: const Text(
                      _summary,
                      style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Education
                  _buildSectionHeader('EDUCATION', Icons.history_edu),
                  ..._education.map(_buildEducationItem),
                  const SizedBox(height: 24),

                  // Projects
                  _buildSectionHeader('PROJECTS', Icons.rocket_launch_outlined),
                  ..._projects.map(_buildProjectItem),
                  const SizedBox(height: 24),

                  // Certifications
                  _buildSectionHeader('CERTIFICATIONS', Icons.workspace_premium_outlined),
                  ..._certs.map(_buildCertItem),
                  const SizedBox(height: 24),

                  // Technical skills
                  _buildSectionHeader('TECHNICAL SKILLS', Icons.terminal),
                  ..._skills.entries.map((e) => _buildSkillGroup(e.key, e.value)),
                  const SizedBox(height: 24),

                  // Soft skills
                  _buildSectionHeader('SOFT SKILLS', Icons.people_outline),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: _softSkills.map((s) => _buildChip(s, cyanAccent, withIcon: true)).toList(),
                  ),
                  const SizedBox(height: 24),

                  // References
                  _buildSectionHeader('REFERENCES', Icons.supervisor_account_outlined),
                  ..._refs.map(_buildRefItem),
                  const SizedBox(height: 30),

                  // Endorse button
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
                        _isLiked ? 'Endorsed (Tap to Undo)' : 'Endorse Rukshan',
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

  // ---------- WIDGET BUILDERS ----------
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
            Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(color: Colors.white54, fontSize: 10), textAlign: TextAlign.center),
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
              Text(value,
                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChip(String text, Color color, {bool withIcon = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: cardDarkElevated,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withIcon) ...[
            Icon(Icons.check_circle_outline, size: 14, color: color),
            const SizedBox(width: 6),
          ],
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildEducationItem(_Edu e) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(e.institution,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: cyanAccent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(e.period,
                          style: const TextStyle(
                              color: cyanAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(e.program, style: const TextStyle(color: cyanAccent, fontSize: 12)),
                const SizedBox(height: 4),
                Text(e.location, style: const TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(_Project p) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p.title,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(p.tech,
              style: const TextStyle(
                  color: cyanAccent, fontSize: 11, fontStyle: FontStyle.italic)),
          const SizedBox(height: 8),
          ...p.points.map(
            (pt) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(Icons.circle, size: 6, color: indigoAccent),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(pt,
                        style: const TextStyle(color: Colors.white70, fontSize: 12.5, height: 1.5)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertItem(_Cert c) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_outlined, size: 20, color: greenAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(c.issuer, style: const TextStyle(color: Colors.white54, fontSize: 11.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillGroup(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white54, fontSize: 11, letterSpacing: 0.5)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((s) => _buildChip(s, indigoAccent)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRefItem(_Ref r) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(r.name,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('${r.post}, ${r.org}',
              style: const TextStyle(color: cyanAccent, fontSize: 12)),
          const SizedBox(height: 8),
          Row(children: [
            const Icon(Icons.email_outlined, size: 14, color: Colors.white54),
            const SizedBox(width: 8),
            Expanded(
                child: Text(r.email, style: const TextStyle(color: Colors.white70, fontSize: 12))),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.phone_outlined, size: 14, color: Colors.white54),
            const SizedBox(width: 8),
            Text(r.phone, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ]),
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
