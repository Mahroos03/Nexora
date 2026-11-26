import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Design Style: Obsidian & Emerald NOC / Cloud Infrastructure Architecture
/// Distinctive features: Curved wave header, live pulsing availability status,
/// interactive skill-domain filter chips, tap-to-copy contact actions,
/// and expandable project/reference cards.
class ImalBioScreen extends StatefulWidget {
  const ImalBioScreen({super.key});

  @override
  State<ImalBioScreen> createState() => _ImalBioScreenState();
}

class _ImalBioScreenState extends State<ImalBioScreen>
    with SingleTickerProviderStateMixin {
  // Color Palette: Deep Obsidian & Emerald Matrix
  static const Color bgPrimary = Color(0xFF090D16);
  static const Color surfaceCard = Color(0xFF111827);
  static const Color surfaceElevated = Color(0xFF1F2937);
  static const Color emeraldPrimary = Color(0xFF10B981);
  static const Color tealAccent = Color(0xFF14B8A6);
  static const Color amberHighlight = Color(0xFFF59E0B);

  late final AnimationController _pulseController;
  String _selectedSkillCategory = 'All';
  int _connectionCount = 42;
  bool _isConnected = false;

  // CV Data Models
  final String fullName = 'Imal Lakshitha';
  final String role = 'Network Engineering Intern';
  final String email = 'imal28588@gmail.com';
  final String phone = '+94 71 879 7609';
  final String location = 'Colombo, Sri Lanka';
  final String linkedin = 'linkedin.com/in/imal-lakshitha-12ab29283';
  final String github = 'github.com/Imal-Lakshitha';

  final String summary =
      'NDT undergraduate at ITUM & HND graduate (Cardiff Met) with a CCNA-trained '
      'foundation in Cisco IOS, routing & switching, VLANs, ACLs, and Packet Tracer '
      'simulation. Hands-on experience deploying AWS EC2/VPC instances, SSH tunneling, '
      'and Python scripting. Seeking a Network Engineering Internship to apply skills '
      'in real-world infrastructure and cloud operations.';

  final Map<String, List<String>> categorizedSkills = <String, List<String>>{
    'Networking': <String>[
      'Cisco IOS',
      'OSPF / RIP / Static Routing',
      'Switching & VLANs',
      'Inter-VLAN Routing',
      'Subnetting (VLSM/CIDR)',
      'ACLs & NAT/PAT',
      'STP / DHCP / DNS / SNMP',
      'TCP/IP',
    ],
    'Cloud & SysAdmin': <String>[
      'AWS (EC2, VPC, Security Groups)',
      'Microsoft Azure',
      'Windows Server',
      'Linux (Ubuntu)',
      'SSH Tunneling',
    ],
    'Tools & Code': <String>[
      'Wireshark (Packet Analysis)',
      'Cisco Packet Tracer',
      'Python',
      'Bash Scripting',
      'Java (Basics)',
    ],
  };

  final List<Map<String, String>> education = <Map<String, String>>[
    <String, String>{
      'degree':
          'National Diploma in Technology (NDT) in Information Technology',
      'institution': 'Institute of Technology, University of Moratuwa (ITUM)',
      'period': '2025 – Present',
    },
    <String, String>{
      'degree':
          'Higher National Diploma (HND) in Computing & Software Engineering',
      'institution': 'Cardiff Metropolitan University (ICBT Campus)',
      'period': 'Completed',
    },
  ];

  final List<Map<String, String>> certifications = <Map<String, String>>[
    <String, String>{
      'title': 'Cisco Certified Network Associate (CCNA)',
      'issuer': 'Cisco (University of Moratuwa)',
    },
    <String, String>{
      'title': 'Introduction to Next Generation Firewall 1.0',
      'issuer': 'Fortinet',
    },
    <String, String>{
      'title': 'Getting Started with AWS Cloud Essentials',
      'issuer': 'Amazon Web Services (AWS)',
    },
    <String, String>{
      'title': 'Introduction to Cybersecurity',
      'issuer': 'Cisco',
    },
    <String, String>{
      'title': 'Python for Beginners',
      'issuer': 'University of Moratuwa',
    },
    <String, String>{'title': 'Linux Unhatched', 'issuer': 'Cisco'},
    <String, String>{'title': 'Google AI Essentials', 'issuer': 'Google'},
  ];

  final List<Map<String, dynamic>> projects = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'Enterprise Campus Network Design & RBAC',
      'stack': 'Cisco IOS • Packet Tracer • VLANs • 802.1X • Extended ACLs',
      'highlights': <String>[
        'Designed a hierarchical campus network with Role-Based Access Control (RBAC) segmenting Faculty, Student, and Guest VLANs.',
        'Configured Inter-VLAN routing, Extended ACLs, and 802.1X/WPA2-Enterprise wireless authentication.',
        'Provisioned DHCP, DNS, and NAT overload pools for seamless internal and external connectivity.',
      ],
    },
    <String, dynamic>{
      'title': 'Automated Cloud Server Monitoring & Alerting System',
      'stack': 'Python • Bash • Linux (Ubuntu) • Cron • Discord Webhooks',
      'highlights': <String>[
        'Built an automated server health monitoring tool using Python & Bash on a Linux cloud instance tracking real-time RAM and disk utilization.',
        'Integrated Discord Webhooks for instant threshold-breach alerts.',
        'Scheduled continuous 24/7 execution via Linux Cron Jobs.',
      ],
    },
  ];

  final List<Map<String, String>> leadership = <Map<String, String>>[
    <String, String>{
      'role':
          "Organizing Committee Member – Pure Path'26 | Volunteer – ZeroPlastic TRAIL'26",
      'org': 'ZeroPlastic NDT Club – University of Moratuwa',
    },
    <String, String>{
      'role': 'Active Member – University Dancing Group',
      'org': 'Institute of Technology, University of Moratuwa (ITUM)',
    },
    <String, String>{
      'role': 'University Sports – Elle & Taekwondo',
      'org': 'Institute of Technology, University of Moratuwa (ITUM)',
    },
  ];

  final List<Map<String, String>> references = <Map<String, String>>[
    <String, String>{
      'name': 'Mrs. Uthpala Athukorala',
      'title': 'Head of Division – Information Technology, ITUM',
      'phone': '077 2666602',
      'email': 'uthpalap@itum.mrt.ac.lk',
    },
    <String, String>{
      'name': 'Mrs. Tharukshi Adasuriya',
      'title': 'Lecturer, Institute of Technology, University of Moratuwa',
      'phone': '077 190 2981',
      'email': 'tharukshin@itum.mrt.ac.lk',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _copyToClipboard(String label, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            const Icon(Icons.check_circle, color: bgPrimary, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Copied $label: $text',
                style: const TextStyle(
                  color: bgPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: emeraldPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleConnect() {
    setState(() {
      _isConnected = !_isConnected;
      _connectionCount += _isConnected ? 1 : -1;
    });
  }

  List<String> get _filteredSkills {
    if (_selectedSkillCategory == 'All') {
      return categorizedSkills.values
          .expand<String>((List<String> list) => list)
          .toList();
    }
    return categorizedSkills[_selectedSkillCategory] ?? <String>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 265,
            pinned: true,
            backgroundColor: bgPrimary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.maybePop(context),
            ),
            actions: <Widget>[
              IconButton(
                tooltip: 'Copy Email',
                icon: const Icon(Icons.copy_all_rounded, color: emeraldPrimary),
                onPressed: () => _copyToClipboard('Email', email),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipPath(
                    clipper: _WaveHeaderClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF064E3B),
                            Color(0xFF0F766E),
                            Color(0xFF111827),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 22,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeTransition(
                          opacity: Tween<double>(
                            begin: 0.55,
                            end: 1.0,
                          ).animate(_pulseController),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: emeraldPrimary.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: emeraldPrimary.withValues(alpha: 0.5),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: emeraldPrimary,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'AVAILABLE FOR INTERNSHIP',
                                  style: TextStyle(
                                    color: emeraldPrimary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: <Color>[emeraldPrimary, tealAccent],
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: emeraldPrimary.withValues(
                                      alpha: 0.35,
                                    ),
                                    blurRadius: 14,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(3),
                              child: const CircleAvatar(
                                backgroundColor: surfaceCard,
                                backgroundImage: AssetImage(
                                  'assets/images/imal.jpg',
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    fullName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    role,
                                    style: const TextStyle(
                                      color: emeraldPrimary,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 13,
                                        color: Colors.white60,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        location,
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildMetricTile(
                        'Certifications',
                        '${certifications.length}',
                        Icons.verified_outlined,
                        emeraldPrimary,
                      ),
                      const SizedBox(width: 10),
                      _buildMetricTile(
                        'Core Projects',
                        '${projects.length}',
                        Icons.lan_outlined,
                        tealAccent,
                      ),
                      const SizedBox(width: 10),
                      _buildMetricTile(
                        'Network',
                        '$_connectionCount',
                        Icons.hub_outlined,
                        amberHighlight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('CONNECT & ENDPOINTS', Icons.terminal),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: surfaceCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.07),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        _buildCopyableContactRow(
                          Icons.email_outlined,
                          'Email',
                          email,
                        ),
                        const Divider(color: Colors.white10, height: 18),
                        _buildCopyableContactRow(
                          Icons.phone_android_outlined,
                          'Mobile',
                          phone,
                        ),
                        const Divider(color: Colors.white10, height: 18),
                        _buildCopyableContactRow(
                          Icons.code_rounded,
                          'GitHub',
                          github,
                        ),
                        const Divider(color: Colors.white10, height: 18),
                        _buildCopyableContactRow(
                          Icons.work_outline_rounded,
                          'LinkedIn',
                          linkedin,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'PROFILE SUMMARY',
                    Icons.description_outlined,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: surfaceCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: emeraldPrimary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      summary,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13.5,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('TECHNICAL STACK', Icons.memory_rounded),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <String>['All', ...categorizedSkills.keys]
                          .map<Widget>((String category) {
                            final bool isSelected =
                                _selectedSkillCategory == category;
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                                bottom: 12,
                              ),
                              child: ChoiceChip(
                                label: Text(category),
                                selected: isSelected,
                                onSelected: (_) => setState(
                                  () => _selectedSkillCategory = category,
                                ),
                                selectedColor: emeraldPrimary,
                                backgroundColor: surfaceCard,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? bgPrimary
                                      : Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: isSelected
                                        ? emeraldPrimary
                                        : Colors.white12,
                                  ),
                                ),
                              ),
                            );
                          })
                          .toList(),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _filteredSkills.map<Widget>((String skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: surfaceElevated,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: tealAccent.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Text(
                          skill,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'TECHNICAL IMPLEMENTATIONS',
                    Icons.router_outlined,
                  ),
                  ...projects.map<Widget>(
                    (Map<String, dynamic> project) =>
                        _buildProjectCard(project),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'ACADEMIC BACKGROUND',
                    Icons.school_outlined,
                  ),
                  ...education.map<Widget>(
                    (Map<String, String> edu) => _buildEducationCard(edu),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'LICENSES & CERTIFICATIONS',
                    Icons.workspace_premium_outlined,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: surfaceCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.07),
                      ),
                    ),
                    child: Column(
                      children: certifications.asMap().entries.map<Widget>((
                        MapEntry<int, Map<String, String>> entry,
                      ) {
                        final int idx = entry.key;
                        final Map<String, String> cert = entry.value;
                        return Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.verified,
                                  color: emeraldPrimary,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        cert['title'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        cert['issuer'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (idx < certifications.length - 1)
                              const Divider(color: Colors.white10, height: 18),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'LEADERSHIP & ACTIVITIES',
                    Icons.groups_outlined,
                  ),
                  ...leadership.map<Widget>(
                    (Map<String, String> item) => Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: surfaceCard,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: amberHighlight.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.emoji_events_outlined,
                              color: amberHighlight,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item['role'] ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item['org'] ?? '',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(
                    'PROFESSIONAL REFERENCES',
                    Icons.contact_mail_outlined,
                  ),
                  ...references.map<Widget>(
                    (Map<String, String> ref) => _buildReferenceCard(ref),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _toggleConnect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isConnected
                            ? surfaceElevated
                            : emeraldPrimary,
                        foregroundColor: _isConnected
                            ? emeraldPrimary
                            : bgPrimary,
                        side: _isConnected
                            ? const BorderSide(color: emeraldPrimary)
                            : BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      icon: Icon(
                        _isConnected
                            ? Icons.check_circle_outline
                            : Icons.person_add_alt_1_rounded,
                      ),
                      label: Text(
                        _isConnected
                            ? 'Connected with Imal'
                            : 'Connect for Internship Opportunities',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                        ),
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

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 16, color: emeraldPrimary),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(
    String label,
    String count,
    IconData icon,
    Color accent,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: surfaceCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: accent.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: <Widget>[
            Icon(icon, color: accent, size: 20),
            const SizedBox(height: 6),
            Text(
              count,
              style: TextStyle(
                color: accent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 10.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyableContactRow(IconData icon, String label, String value) {
    return InkWell(
      onTap: () => _copyToClipboard(label, value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 18, color: tealAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.content_copy_rounded,
              size: 15,
              color: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    final highlights = (project['highlights'] as Iterable<dynamic>)
        .cast<String>()
        .toList();
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: emeraldPrimary.withValues(alpha: 0.22)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          iconColor: emeraldPrimary,
          collapsedIconColor: Colors.white54,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Text(
            (project['title'] ?? '') as String,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              (project['stack'] ?? '') as String,
              style: const TextStyle(
                color: tealAccent,
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          children: highlights.map<Widget>((String point) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    '▹ ',
                    style: TextStyle(color: emeraldPrimary, fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.5,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEducationCard(Map<String, String> edu) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: emeraldPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  edu['period'] ?? '',
                  style: const TextStyle(
                    color: emeraldPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.school, color: Colors.white24, size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            edu['degree'] ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            edu['institution'] ?? '',
            style: const TextStyle(color: Colors.white60, fontSize: 12.5),
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceCard(Map<String, String> ref) {
    final String name = ref['name'] ?? '';
    final String phoneText = ref['phone'] ?? '';
    final String emailText = ref['email'] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surfaceCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            ref['title'] ?? '',
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _copyToClipboard('$name Phone', phoneText),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: emeraldPrimary,
                    side: BorderSide(
                      color: emeraldPrimary.withValues(alpha: 0.4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: const Icon(Icons.phone, size: 14),
                  label: Text(
                    phoneText,
                    style: const TextStyle(fontSize: 11.5),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _copyToClipboard('$name Email', emailText),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: tealAccent,
                    side: BorderSide(color: tealAccent.withValues(alpha: 0.4)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  icon: const Icon(Icons.email, size: 14),
                  label: const Text(
                    'Copy Email',
                    style: TextStyle(fontSize: 11.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WaveHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - 35);
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height,
      size.width * 0.7,
      size.height - 25,
    );
    path.quadraticBezierTo(
      size.width * 0.88,
      size.height - 40,
      size.width,
      size.height - 15,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
