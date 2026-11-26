import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Bio & CV screen for Buddhika Sandaru.
///
/// Design: Network Operations / Blueprint aesthetic with a custom topology-grid
/// header card, copyable contact pills, section filter chips, categorized
/// skill matrix, expandable project architecture cards, and Dark/Light toggle.
class BuddhikaBioScreen extends StatefulWidget {
  const BuddhikaBioScreen({super.key});

  @override
  State<BuddhikaBioScreen> createState() => _BuddhikaBioScreenState();
}

enum _SectionFilter { all, skills, projects, credentials }

class _BuddhikaBioScreenState extends State<BuddhikaBioScreen> {
  // ---------------------------------------------------------------------------
  // Profile data
  // ---------------------------------------------------------------------------
  static const String _name = 'Buddhika Sandaru';
  static const String _role = 'Network Engineering Undergraduate';
  static const String _location = 'Chilaw, Nattandiya, Sri Lanka';
  static const String _email = 'buddhika.sandaru12@gmail.com';
  static const String _phone = '+94 70 505 2553';
  static const String _linkedin = 'linkedin.com/in/buddhika-sandaru-37017035b';
  static const String _github = 'github.com/Buddhika12-Sandaru';
  static const String _photoPath = 'assets/images/buddhika.jpg';

  static const String _summary =
      'NDT undergraduate at the Institute of Technology, University of Moratuwa '
      '(ITUM) with a CCNA-certified foundation in Cisco IOS, routing & switching, '
      'VLANs, ACLs, and Packet Tracer simulation. Hands-on experience designing '
      'and implementing enterprise-level campus network topologies, configuring '
      'inter-VLAN routing, and applying network security best practices. Seeking '
      'a Network Engineering Internship to apply skills in real-world '
      'infrastructure and operations environments.';

  static const List<_Certification> _certifications = [
    _Certification(
      title: 'Cisco Certified Network Associate (CCNA)',
      issuer: 'Cisco',
      status: '2026',
      isOngoing: false,
    ),
    _Certification(
      title: 'Introduction to Cybersecurity',
      issuer: 'Cisco',
      status: 'Ongoing',
      isOngoing: true,
    ),
  ];

  static const _Education _education = _Education(
    degree: 'National Diploma in Technology (NDT) in Information Technology',
    institution: 'Institute of Technology, University of Moratuwa (ITUM)',
    period: '2025 – Present',
  );

  static const List<_SkillCategory> _skillCategories = [
    _SkillCategory(
      title: 'Networking & Protocols',
      icon: Icons.lan_outlined,
      items: [
        'Cisco IOS',
        'OSPF',
        'RIP',
        'Static Routing',
        'VLANs',
        'Inter-VLAN Routing',
        'Switching',
        'STP',
        'LACP EtherChannel',
        'HSRP',
        'Subnetting (VLSM/CIDR)',
        'TCP/IP',
        'DHCP',
        'DNS',
        'NAT/PAT',
        'SNMP',
      ],
    ),
    _SkillCategory(
      title: 'Security',
      icon: Icons.security_outlined,
      items: [
        'Extended ACLs',
        '802.1X / WPA2-Enterprise',
        'RBAC',
        'SSH v2',
        'Port Security',
        'DHCP Snooping',
        'GRE/IPsec',
      ],
    ),
    _SkillCategory(
      title: 'Tools & Simulation',
      icon: Icons.build_outlined,
      items: ['Cisco Packet Tracer', 'Wireshark'],
    ),
    _SkillCategory(
      title: 'Programming',
      icon: Icons.terminal_outlined,
      items: ['Python (Basics)'],
    ),
  ];

  static const List<_Project> _projects = [
    _Project(
      title: 'CampusNet Pro: Resilient Two-Site Enterprise Network',
      period: '2025 – 2026',
      techStack: [
        'Cisco IOS',
        'Packet Tracer',
        'VLANs',
        'HSRP',
        'OSPF',
        'GRE/IPsec',
        'Extended ACLs',
        'NAT/PAT',
        'DHCP/DNS',
        'Rapid-PVST+',
        'LACP EtherChannel',
        'SSH',
        'Python',
      ],
      highlights: [
        'Built a two-site enterprise network with a redundant Layer 3 core '
            '(HSRP + LACP EtherChannel) and a GRE/IPsec tunnel carrying OSPF '
            'to the branch; implemented Role-Based Access Control (RBAC) for '
            'Staff, Student, and Guest VLANs with extended ACLs enforcing '
            'per-role traffic policies.',
        'Hardened all devices with SSH v2 (2048-bit RSA), port security '
            '(sticky MAC), DHCP snooping, VTY access-class and login block; '
            'wrote a Python baseline-config generator to automate device '
            'provisioning.',
      ],
    ),
    _Project(
      title: 'Secure Multi-Site Enterprise Network (Three-Site)',
      period: '2025 – 2026',
      techStack: [
        'Cisco IOS',
        'Packet Tracer',
        'VLANs',
        'OSPF',
        'Router-on-a-Stick',
        'NAT/PAT',
        'Extended ACLs',
        'DHCP',
        'LACP EtherChannel',
        'SSH',
      ],
      highlights: [
        'Designed and implemented a three-site company network (Head Office + '
            '2 Branches) using OSPF for routing, router-on-a-stick for '
            'inter-VLAN routing, and NAT/PAT for internet access; EtherChannel '
            '(LACP) provided link redundancy between head office switches.',
        'Secured the network with Guest isolation via extended ACLs, SSH v2 '
            'on all 8 devices, port security (sticky MAC), DHCP snooping, and '
            'unused-port shutdown; verified enforcement with documented test '
            'plans and screenshots.',
      ],
    ),
  ];

  static const _Reference _reference = _Reference(
    name: 'Mrs. Shashika Ruwanmini',
    role: 'Lecturer — Information Technology',
    institution: 'Institute of Technology, University of Moratuwa',
    phone: '077 855 8303',
  );

  // ---------------------------------------------------------------------------
  // State
  // ---------------------------------------------------------------------------
  bool _isDark = true; // NOC dark mode by default
  bool _isBookmarked = false;
  _SectionFilter _filter = _SectionFilter.all;

  Future<void> _copyText(String label, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$label copied: $value'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final p = _isDark ? _NocPalette.dark : _NocPalette.light;

    return Scaffold(
      backgroundColor: p.bg,
      appBar: AppBar(
        backgroundColor: p.surface,
        foregroundColor: p.text,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: p.border),
        ),
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: p.emerald,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: p.emerald.withValues(alpha: 0.6),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'NET_PROFILE // CCNA',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: p.text,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: _isDark ? 'Switch to Blueprint Light' : 'Switch to NOC Dark',
            icon: Icon(_isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => setState(() => _isDark = !_isDark),
          ),
          IconButton(
            tooltip: 'Bookmark profile',
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: _isBookmarked ? p.cyan : p.text,
            ),
            onPressed: () => setState(() => _isBookmarked = !_isBookmarked),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            children: [
              _buildHeaderCard(p),
              const SizedBox(height: 16),
              _buildFilterRail(p),
              const SizedBox(height: 16),
              if (_filter == _SectionFilter.all) ...[
                _buildSummaryCard(p),
                const SizedBox(height: 16),
              ],
              if (_filter == _SectionFilter.all ||
                  _filter == _SectionFilter.credentials) ...[
                _buildCredentialsSection(p),
                const SizedBox(height: 16),
              ],
              if (_filter == _SectionFilter.all ||
                  _filter == _SectionFilter.skills) ...[
                _buildSkillsSection(p),
                const SizedBox(height: 16),
              ],
              if (_filter == _SectionFilter.all ||
                  _filter == _SectionFilter.projects) ...[
                _buildProjectsSection(p),
                const SizedBox(height: 16),
              ],
              if (_filter == _SectionFilter.all ||
                  _filter == _SectionFilter.credentials)
                _buildReferenceCard(p),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(_NocPalette p) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: p.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: p.border),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _TopologyGridPainter(p)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatar(p),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: p.cyan.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: p.cyan.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Text(
                              'CCNA CERTIFIED • ITUM',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: p.cyan,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: p.text,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _role,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: p.cyan,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 15,
                                color: p.subText,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  _location,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: p.subText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Divider(height: 1, color: p.border),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _ContactPill(
                      p: p,
                      icon: Icons.email_outlined,
                      label: _email,
                      onTap: () => _copyText('Email', _email),
                    ),
                    _ContactPill(
                      p: p,
                      icon: Icons.phone_outlined,
                      label: _phone,
                      onTap: () => _copyText('Phone', _phone),
                    ),
                    _ContactPill(
                      p: p,
                      icon: Icons.link,
                      label: 'LinkedIn',
                      onTap: () => _copyText('LinkedIn', _linkedin),
                    ),
                    _ContactPill(
                      p: p,
                      icon: Icons.code,
                      label: 'GitHub',
                      onTap: () => _copyText('GitHub', _github),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(_NocPalette p) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        color: p.chip,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: p.cyan, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        _photoPath,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.hub_outlined, color: p.cyan, size: 30),
              const SizedBox(height: 2),
              Text(
                'BS',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: p.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterRail(_NocPalette p) {
    const items = [
      (_SectionFilter.all, 'All Sections', Icons.dashboard_outlined),
      (_SectionFilter.skills, 'Technical Skills', Icons.lan_outlined),
      (_SectionFilter.projects, 'Projects', Icons.account_tree_outlined),
      (_SectionFilter.credentials, 'Certs & Edu', Icons.verified_outlined),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final (value, label, icon) in items) ...[
            ChoiceChip(
              selected: _filter == value,
              onSelected: (_) => setState(() => _filter = value),
              avatar: Icon(
                icon,
                size: 16,
                color: _filter == value ? p.onCyan : p.subText,
              ),
              label: Text(label),
              labelStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _filter == value ? p.onCyan : p.text,
              ),
              selectedColor: p.cyan,
              backgroundColor: p.surface,
              side: BorderSide(
                color: _filter == value ? p.cyan : p.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              showCheckmark: false,
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryCard(_NocPalette p) {
    return _BlueprintCard(
      p: p,
      tag: '01 // SUMMARY',
      title: 'Profile Overview',
      icon: Icons.terminal_outlined,
      child: Text(
        _summary,
        style: TextStyle(
          color: p.text,
          fontSize: 14,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildCredentialsSection(_NocPalette p) {
    return Column(
      children: [
        _BlueprintCard(
          p: p,
          tag: '02 // LICENSES & CERTIFICATIONS',
          title: 'Certifications',
          icon: Icons.verified_outlined,
          child: Column(
            children: [
              for (var i = 0; i < _certifications.length; i++) ...[
                _CertTile(p: p, cert: _certifications[i]),
                if (i != _certifications.length - 1)
                  const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        _BlueprintCard(
          p: p,
          tag: '03 // EDUCATION',
          title: 'Academic Background',
          icon: Icons.school_outlined,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: p.chip,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: p.border),
                ),
                child: Icon(Icons.school, color: p.cyan, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _education.degree,
                            style: TextStyle(
                              color: p.text,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _StatusBadge(
                          label: _education.period,
                          color: p.cyan,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _education.institution,
                      style: TextStyle(color: p.subText, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection(_NocPalette p) {
    return _BlueprintCard(
      p: p,
      tag: '04 // TECHNICAL SKILLS',
      title: 'Networking, Security & Tooling',
      icon: Icons.lan_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _skillCategories.length; i++) ...[
            _SkillGroup(p: p, category: _skillCategories[i]),
            if (i != _skillCategories.length - 1) ...[
              const SizedBox(height: 14),
              Divider(height: 1, color: p.border),
              const SizedBox(height: 14),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildProjectsSection(_NocPalette p) {
    return _BlueprintCard(
      p: p,
      tag: '05 // KEY IMPLEMENTATIONS',
      title: 'Network Engineering Projects',
      icon: Icons.account_tree_outlined,
      child: Column(
        children: [
          for (var i = 0; i < _projects.length; i++) ...[
            _ProjectCard(
              p: p,
              project: _projects[i],
              initiallyExpanded: i == 0,
            ),
            if (i != _projects.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _buildReferenceCard(_NocPalette p) {
    return _BlueprintCard(
      p: p,
      tag: '06 // REFERENCE',
      title: 'Professional Reference',
      icon: Icons.badge_outlined,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _reference.name,
                  style: TextStyle(
                    color: p.text,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _reference.role,
                  style: TextStyle(
                    color: p.cyan,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _reference.institution,
                  style: TextStyle(color: p.subText, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: () => _copyText('Reference Tel', _reference.phone),
            icon: Icon(Icons.phone_outlined, size: 16, color: p.cyan),
            label: Text(
              _reference.phone,
              style: TextStyle(
                fontFamily: 'monospace',
                color: p.text,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: p.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Data models
// -----------------------------------------------------------------------------

class _Certification {
  const _Certification({
    required this.title,
    required this.issuer,
    required this.status,
    required this.isOngoing,
  });

  final String title;
  final String issuer;
  final String status;
  final bool isOngoing;
}

class _Education {
  const _Education({
    required this.degree,
    required this.institution,
    required this.period,
  });

  final String degree;
  final String institution;
  final String period;
}

class _SkillCategory {
  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<String> items;
}

class _Project {
  const _Project({
    required this.title,
    required this.period,
    required this.techStack,
    required this.highlights,
  });

  final String title;
  final String period;
  final List<String> techStack;
  final List<String> highlights;
}

class _Reference {
  const _Reference({
    required this.name,
    required this.role,
    required this.institution,
    required this.phone,
  });

  final String name;
  final String role;
  final String institution;
  final String phone;
}

// -----------------------------------------------------------------------------
// NOC / Blueprint Palette
// -----------------------------------------------------------------------------

class _NocPalette {
  const _NocPalette({
    required this.bg,
    required this.surface,
    required this.chip,
    required this.border,
    required this.text,
    required this.subText,
    required this.cyan,
    required this.onCyan,
    required this.emerald,
    required this.amber,
  });

  final Color bg;
  final Color surface;
  final Color chip;
  final Color border;
  final Color text;
  final Color subText;
  final Color cyan;
  final Color onCyan;
  final Color emerald;
  final Color amber;

  static const dark = _NocPalette(
    bg: Color(0xFF070B14),
    surface: Color(0xFF0E1628),
    chip: Color(0xFF142038),
    border: Color(0xFF1E2D4A),
    text: Color(0xFFE6EDF7),
    subText: Color(0xFF8FA3C0),
    cyan: Color(0xFF00E5FF),
    onCyan: Color(0xFF04131E),
    emerald: Color(0xFF10B981),
    amber: Color(0xFFF59E0B),
  );

  static const light = _NocPalette(
    bg: Color(0xFFF3F6FA),
    surface: Color(0xFFFFFFFF),
    chip: Color(0xFFEFF4FB),
    border: Color(0xFFD5E0EE),
    text: Color(0xFF0F172A),
    subText: Color(0xFF475569),
    cyan: Color(0xFF0284C7),
    onCyan: Color(0xFFFFFFFF),
    emerald: Color(0xFF059669),
    amber: Color(0xFFD97706),
  );
}

// -----------------------------------------------------------------------------
// Topology Grid Painter
// -----------------------------------------------------------------------------

class _TopologyGridPainter extends CustomPainter {
  const _TopologyGridPainter(this.p);

  final _NocPalette p;

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = p.border.withValues(alpha: 0.45)
      ..strokeWidth = 1;

    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Subtle network node links in the top-right corner
    final linkPaint = Paint()
      ..color = p.cyan.withValues(alpha: 0.16)
      ..strokeWidth = 1.4;
    final nodePaint = Paint()..color = p.cyan.withValues(alpha: 0.28);

    final n1 = Offset(size.width * 0.78, size.height * 0.22);
    final n2 = Offset(size.width * 0.90, size.height * 0.14);
    final n3 = Offset(size.width * 0.93, size.height * 0.42);

    canvas
      ..drawLine(n1, n2, linkPaint)
      ..drawLine(n2, n3, linkPaint)
      ..drawLine(n1, n3, linkPaint)
      ..drawCircle(n1, 4, nodePaint)
      ..drawCircle(n2, 5, nodePaint)
      ..drawCircle(n3, 4, nodePaint);
  }

  @override
  bool shouldRepaint(covariant _TopologyGridPainter oldDelegate) =>
      oldDelegate.p != p;
}

// -----------------------------------------------------------------------------
// Reusable Components
// -----------------------------------------------------------------------------

class _BlueprintCard extends StatelessWidget {
  const _BlueprintCard({
    required this.p,
    required this.tag,
    required this.title,
    required this.icon,
    required this.child,
  });

  final _NocPalette p;
  final String tag;
  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: p.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: p.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tag,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: p.cyan,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(icon, size: 18, color: p.subText),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: p.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _ContactPill extends StatelessWidget {
  const _ContactPill({
    required this.p,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final _NocPalette p;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: p.chip,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: p.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: p.cyan),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: p.text,
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.content_copy, size: 12, color: p.subText),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class _CertTile extends StatelessWidget {
  const _CertTile({required this.p, required this.cert});

  final _NocPalette p;
  final _Certification cert;

  @override
  Widget build(BuildContext context) {
    final badgeColor = cert.isOngoing ? p.amber : p.emerald;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: p.chip,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: p.border),
      ),
      child: Row(
        children: [
          Icon(
            cert.isOngoing ? Icons.pending_outlined : Icons.verified,
            color: badgeColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cert.title,
                  style: TextStyle(
                    color: p.text,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  cert.issuer,
                  style: TextStyle(color: p.subText, fontSize: 12.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _StatusBadge(label: cert.status, color: badgeColor),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.p, required this.category});

  final _NocPalette p;
  final _SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(category.icon, size: 16, color: p.cyan),
            const SizedBox(width: 6),
            Text(
              category.title,
              style: TextStyle(
                color: p.text,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final item in category.items)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: p.chip,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: p.border),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                    color: p.text,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.p,
    required this.project,
    required this.initiallyExpanded,
  });

  final _NocPalette p;
  final _Project project;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: p.chip,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: p.border),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          iconColor: p.cyan,
          collapsedIconColor: p.subText,
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          title: Text(
            project.title,
            style: TextStyle(
              color: p.text,
              fontWeight: FontWeight.w700,
              fontSize: 14.5,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _StatusBadge(label: project.period, color: p.cyan),
            ),
          ),
          children: [
            for (final point in project.highlights)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: p.cyan,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        point,
                        style: TextStyle(
                          color: p.text,
                          fontSize: 13.5,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final tech in project.techStack)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: p.surface,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: p.border),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: p.cyan,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
