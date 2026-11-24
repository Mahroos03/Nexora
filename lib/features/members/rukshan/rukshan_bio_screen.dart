import 'package:flutter/material.dart';
import '../../../core/models/member_model.dart';
import '../../../core/state/favorites_manager.dart';
import '../../../core/widgets/member_avatar.dart';

/// Design Style: Editorial Paper (light theme), populated from Rukshan's CV.
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

  // ---------- THEME (edit here to re-skin) ----------
  static const Color bgPaper = Color(0xFFF7F3EC);
  static const Color card = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF1F2933);
  static const Color muted = Color(0xFF6B7280);
  static const Color line = Color(0xFFE5DED2);
  static const Color forest = Color(0xFF1F6F5C);
  static const Color terracotta = Color(0xFFC8553D);
  static const Color sand = Color(0xFFEFE8DA);
  static const String serif = 'serif';

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
        backgroundColor: forest,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: line),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final double halfWidth = (MediaQuery.of(context).size.width - 36 - 10) / 2;

    return Scaffold(
      backgroundColor: bgPaper,
      appBar: AppBar(
        backgroundColor: bgPaper,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: ink, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? terracotta : ink,
            ),
            onPressed: _toggleLike,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),

            // Live stats
            ListenableBuilder(
              listenable: _favManager,
              builder: (context, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: _cardDecoration,
                  child: Row(
                    children: [
                      _buildStat('${_favManager.getEndorsementCount(member.id)}', 'Endorsements', terracotta),
                      _statDivider(),
                      _buildStat('${_projects.length}', 'Projects', forest),
                      _statDivider(),
                      _buildStat('${_certs.length}', 'Certifications', ink),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 28),

            _buildSectionTitle('Professional Summary'),
            Text(
              _summary,
              style: const TextStyle(color: ink, fontSize: 14, height: 1.7),
            ),
            const SizedBox(height: 28),

            _buildSectionTitle('Education'),
            ...List.generate(_education.length,
                (i) => _buildEducationItem(_education[i], isLast: i == _education.length - 1)),
            const SizedBox(height: 28),

            _buildSectionTitle('Projects'),
            ...List.generate(_projects.length, (i) => _buildProjectItem(_projects[i], i + 1)),
            const SizedBox(height: 28),

            _buildSectionTitle('Certifications'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _certs.map((c) => _buildCertItem(c, halfWidth)).toList(),
            ),
            const SizedBox(height: 28),

            _buildSectionTitle('Technical Skills'),
            ..._skills.entries.map((e) => _buildSkillGroup(e.key, e.value)),
            const SizedBox(height: 14),

            _buildSectionTitle('Soft Skills'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _softSkills.map((s) => _buildChip(s, terracotta)).toList(),
            ),
            const SizedBox(height: 28),

            _buildSectionTitle('References'),
            ..._refs.map(_buildRefItem),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
          decoration: const BoxDecoration(
            color: bgPaper,
            border: Border(top: BorderSide(color: line)),
          ),
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _toggleLike,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isLiked ? terracotta : forest,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: Icon(_isLiked ? Icons.favorite : Icons.thumb_up_alt_outlined, size: 20),
              label: Text(
                _isLiked ? 'Endorsed (Tap to Undo)' : 'Endorse Rukshan',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------- WIDGET BUILDERS ----------
  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          MemberAvatar(
            name: _name,
            imageUrl: member.avatarUrl,
            radius: 52,
            borderWidth: 3,
            borderColor: forest,
            gradientColors: const [Color(0xFF1F6F5C), Color(0xFFC8553D)],
          ),
          const SizedBox(height: 14),
          const Text(
            _name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: serif,
              color: ink,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            _role,
            style: TextStyle(color: forest, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.6),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, size: 14, color: muted),
              SizedBox(width: 4),
              Text(_address, style: TextStyle(color: muted, fontSize: 12.5)),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildContactPill(Icons.email_outlined, _email),
              _buildContactPill(Icons.phone_outlined, _phone),
              _buildContactPill(Icons.link, 'LinkedIn | GitHub'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactPill(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: sand,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: forest),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: ink, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: terracotta,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontFamily: serif,
              color: ink,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontFamily: serif, color: color, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: muted, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _statDivider() => Container(width: 1, height: 32, color: line);

  Widget _buildChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildEducationItem(_Edu e, {required bool isLast}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 22,
            child: Column(
              children: [
                const SizedBox(height: 4),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: bgPaper,
                    shape: BoxShape.circle,
                    border: Border.all(color: forest, width: 3),
                  ),
                ),
                if (!isLast) Expanded(child: Container(width: 2, color: line)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.period,
                    style: const TextStyle(color: terracotta, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    e.institution,
                    style: const TextStyle(color: ink, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(e.program, style: const TextStyle(color: forest, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(e.location, style: const TextStyle(color: muted, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(_Project p, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontFamily: serif,
                  color: terracotta,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  p.title,
                  style: const TextStyle(color: ink, fontSize: 14.5, fontWeight: FontWeight.bold, height: 1.35),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            p.tech,
            style: const TextStyle(color: forest, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          ...p.points.map(
            (pt) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Icon(Icons.circle, size: 5, color: terracotta),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(pt, style: const TextStyle(color: ink, fontSize: 12.5, height: 1.55)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertItem(_Cert c, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.workspace_premium_outlined, size: 22, color: forest),
          const SizedBox(height: 8),
          Text(
            c.title,
            style: const TextStyle(color: ink, fontSize: 13, fontWeight: FontWeight.bold, height: 1.3),
          ),
          const SizedBox(height: 4),
          Text(c.issuer, style: const TextStyle(color: muted, fontSize: 11.5, height: 1.3)),
        ],
      ),
    );
  }

  Widget _buildSkillGroup(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(color: muted, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((s) => _buildChip(s, forest)).toList(),
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
          Text(r.name, style: const TextStyle(color: ink, fontSize: 14.5, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text('${r.post}, ${r.org}', style: const TextStyle(color: forest, fontSize: 12.5)),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.email_outlined, size: 14, color: muted),
            const SizedBox(width: 8),
            Expanded(child: Text(r.email, style: const TextStyle(color: ink, fontSize: 12.5))),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.phone_outlined, size: 14, color: muted),
            const SizedBox(width: 8),
            Text(r.phone, style: const TextStyle(color: ink, fontSize: 12.5)),
          ]),
        ],
      ),
    );
  }
}
