import 'package:flutter/material.dart';
import '../../../core/models/member_model.dart';
import '../../../core/state/favorites_manager.dart';

/// Design Style: Soft Plum & Rose gradient (light theme), populated from Naduni's CV.
class NaduniBioScreen extends StatefulWidget {
  const NaduniBioScreen({super.key});

  @override
  State<NaduniBioScreen> createState() => _NaduniBioScreenState();
}

// ---------- Simple data holders ----------
class _Edu {
  final String institution, program, location, period;
  const _Edu(this.institution, this.program, this.location, this.period);
}

class _Project {
  final String title, org, description;
  const _Project(this.title, this.org, this.description);
}

class _Cert {
  final String title, issuer;
  const _Cert(this.title, this.issuer);
}

class _Ref {
  final String name, post, email, phone;
  const _Ref(this.name, this.post, this.email, this.phone);
}

class _NaduniBioScreenState extends State<NaduniBioScreen> {
  final MemberData member = NexoraMembers.getById(5);
  final FavoritesManager _favManager = FavoritesManager();
  bool _isLiked = false;

  // ---------- CV DATA ----------
  static const String _name = 'Naduni Vimadhya Lakpura';
  static const String _role = 'Intern Software Engineer';
  static const String _email = 'nadunivimadhya6@gmail.com';
  static const String _phone = '070 272 2879';
  static const String _address = 'Galle, Sri Lanka';
  static const String _linkedin = 'linkedin.com/in/nadunivimadhya';
  static const String _github = 'github.com/NaduniVimadhya';
  static const String _photoPath = 'assets/images/naduni.jpg';

  static const String _summary =
      'Motivated and detail-oriented aspiring Software Engineer with a solid '
      'foundation in core computing principles, system analysis, and end-to-end '
      'application development. Proven ability to translate user requirements into '
      'functional, scalable solutions through structured design and disciplined '
      'implementation. Seeking a Software Engineering Internship to contribute '
      'strong problem-solving capabilities, adaptability, and collaborative drive '
      'to high-impact projects.';

  static const List<_Edu> _education = [
    _Edu(
      'Institute of Technology, University of Moratuwa (ITUM)',
      'National Diploma in Information Technology (NDT)',
      'Moratuwa, Sri Lanka',
      '2025 – Present',
    ),
  ];

  static const List<_Project> _projects = [
    _Project(
      'Serva – University Maintenance Management System',
      'Institute of Technology, University of Moratuwa',
      'Collaborated in designing and developing an end-to-end, automated facility '
          'maintenance management platform to digitize and streamline the reporting, '
          'prioritization, and resolution of campus infrastructure issues. Contributed '
          'across system requirements specification, MySQL database architecture, and '
          'backend service implementation to deliver a secure, multi-tier system with '
          'real-time incident tracking and role-based access for requesters and '
          'university maintenance staff.',
    ),
    _Project(
      'Charitap – Donation Platform',
      'Software Development Project',
      'Developed an interactive web-based charitable donation platform connecting '
          'donors with community causes and verified organizations.',
    ),
    _Project(
      'Event Management System',
      'Software Development Project',
      'Developed a responsive event management and attendee booking platform '
          'featuring secure role-based session authentication. Integrated dynamic '
          'registration workflows backed by a relational database system and '
          'responsive front-end interfaces.',
    ),
  ];

  static const List<_Cert> _certs = [
    _Cert('Python for Beginners', 'CODL, University of Moratuwa'),
    _Cert('Microsoft Office Suite', 'Open University of Sri Lanka'),
    _Cert('English (Intermediate)', 'Aquinas College of Higher Studies'),
  ];

  static const List<String> _technicalSkills = [
    'Python',
    'Java',
    'Web Development',
    'MySQL Database Management',
    'Microsoft Office Suite',
  ];

  static const List<String> _softSkills = [
    'Problem Solving & Logic',
    'Teamwork',
    'Communication',
    'Time Management',
  ];

  static const List<List<String>> _languages = [
    ['English', 'Professional Working'],
    ['Sinhala', 'Native'],
  ];

  static const List<_Ref> _refs = [
    _Ref('Mrs. Uthpala Athukorala', 'Senior Lecturer, ITUM', 'uthpalap@itum.mrt.ac.lk', '077 266 6602'),
    _Ref('Mrs. Shashika Ruwanmini', 'Senior Lecturer, ITUM', 'ruwanminis@itum.mrt.ac.lk', '077 855 8303'),
  ];

  // ---------- THEME (edit here to re-skin) ----------
  static const Color bgBlush = Color(0xFFFDF7FA);
  static const Color plum = Color(0xFF4C1D95);
  static const Color plumDeep = Color(0xFF2E1065);
  static const Color rose = Color(0xFFEC4899);
  static const Color lavender = Color(0xFFF3E8FF);
  static const Color ink = Color(0xFF2B1B3D);
  static const Color muted = Color(0xFF7C6A8E);
  static const Color line = Color(0xFFEBDDF5);

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
        content: Text(_isLiked ? 'Endorsed Naduni!' : 'Removed endorsement'),
        backgroundColor: plum,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: line),
        boxShadow: [
          BoxShadow(
            color: plum.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlush,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Live stats
                  ListenableBuilder(
                    listenable: _favManager,
                    builder: (context, _) {
                      return Row(
                        children: [
                          _buildStatCard('${_favManager.getEndorsementCount(member.id)}', 'Endorsements', Icons.bolt, rose),
                          const SizedBox(width: 10),
                          _buildStatCard('${_projects.length}', 'Projects', Icons.code, plum),
                          const SizedBox(width: 10),
                          _buildStatCard('${_certs.length}', 'Certificates', Icons.verified, const Color(0xFF7C3AED)),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 26),

                  _buildSectionTitle('About Me', Icons.person_outline),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: _cardDecoration,
                    child: const Text(
                      _summary,
                      style: TextStyle(color: ink, fontSize: 13.5, height: 1.7),
                    ),
                  ),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Contact', Icons.alternate_email),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: _cardDecoration,
                    child: Column(
                      children: [
                        _buildContactRow(Icons.email_outlined, 'Email', _email),
                        _divider(),
                        _buildContactRow(Icons.phone_outlined, 'Phone', _phone),
                        _divider(),
                        _buildContactRow(Icons.location_on_outlined, 'Location', _address),
                        _divider(),
                        _buildContactRow(Icons.business_center_outlined, 'LinkedIn', _linkedin),
                        _divider(),
                        _buildContactRow(Icons.code, 'GitHub', _github),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Education', Icons.school_outlined),
                  ..._education.map(_buildEducationItem),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Project Experience', Icons.rocket_launch_outlined),
                  ..._projects.map(_buildProjectItem),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Technical Skills', Icons.terminal),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _technicalSkills.map((s) => _buildChip(s, plum)).toList(),
                  ),
                  const SizedBox(height: 22),

                  _buildSectionTitle('Soft Skills', Icons.people_outline),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _softSkills.map((s) => _buildChip(s, rose)).toList(),
                  ),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Certifications', Icons.workspace_premium_outlined),
                  ..._certs.map(_buildCertItem),
                  const SizedBox(height: 26),

                  _buildSectionTitle('Languages', Icons.translate),
                  Row(
                    children: _languages
                        .map((l) => Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: l == _languages.last ? 0 : 10),
                                padding: const EdgeInsets.all(14),
                                decoration: _cardDecoration,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l[0],
                                        style: const TextStyle(
                                            color: ink, fontSize: 15, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(l[1], style: const TextStyle(color: muted, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 26),

                  _buildSectionTitle('References', Icons.supervisor_account_outlined),
                  ..._refs.map(_buildRefItem),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
          decoration: const BoxDecoration(
            color: bgBlush,
            border: Border(top: BorderSide(color: line)),
          ),
          child: SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _toggleLike,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isLiked ? rose : plum,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              icon: Icon(_isLiked ? Icons.favorite : Icons.thumb_up_alt_outlined, size: 20),
              label: Text(
                _isLiked ? 'Endorsed (Tap to Undo)' : 'Endorse Naduni',
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
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [plumDeep, plum, Color(0xFFBE3A9A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.arrow_back_ios_new, () => Navigator.pop(context)),
                  _circleButton(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    _toggleLike,
                    color: _isLiked ? const Color(0xFFFDA4AF) : Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              _buildProfilePhoto(),
              const SizedBox(height: 14),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  _name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                ),
                child: const Text(
                  _role,
                  style: TextStyle(color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined, size: 14, color: Colors.white.withValues(alpha: 0.8)),
                  const SizedBox(width: 4),
                  Text(_address,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 12.5)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap, {Color color = Colors.white}) {
    return Material(
      color: Colors.white.withValues(alpha: 0.15),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 20, color: color),
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    const double size = 108;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Container(
          width: size,
          height: size,
          color: lavender,
          child: Image.asset(
            _photoPath,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) {
              debugPrint('IMAGE ERROR: $error');
              return const Center(
                child: Text(
                  'NV',
                  style: TextStyle(color: plum, fontSize: 34, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [plum, rose]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(color: ink, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: _cardDecoration,
        child: Column(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 6),
            Text(value, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(color: muted, fontSize: 10.5)),
          ],
        ),
      ),
    );
  }

  Widget _divider() => const Divider(color: line, height: 20);

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(color: lavender, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, size: 16, color: plum),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(color: ink, fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12.5, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildEducationItem(_Edu e) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: lavender, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.school, size: 22, color: plum),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.period,
                    style: const TextStyle(color: rose, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(e.institution,
                    style: const TextStyle(color: ink, fontSize: 14.5, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(e.program, style: const TextStyle(color: plum, fontSize: 12.5)),
                const SizedBox(height: 3),
                Text(e.location, style: const TextStyle(color: muted, fontSize: 12)),
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
      decoration: _cardDecoration,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [plum, rose],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.title,
                        style: const TextStyle(
                            color: ink, fontSize: 14.5, fontWeight: FontWeight.bold, height: 1.3)),
                    const SizedBox(height: 4),
                    Text(p.org,
                        style: const TextStyle(
                            color: rose, fontSize: 11.5, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text(p.description,
                        style: const TextStyle(color: ink, fontSize: 12.5, height: 1.6)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertItem(_Cert c) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration,
      child: Row(
        children: [
          const Icon(Icons.verified_outlined, size: 22, color: plum),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.title,
                    style: const TextStyle(color: ink, fontSize: 13.5, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(c.issuer, style: const TextStyle(color: muted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRefItem(_Ref r) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(r.name, style: const TextStyle(color: ink, fontSize: 14.5, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(r.post, style: const TextStyle(color: plum, fontSize: 12.5)),
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
