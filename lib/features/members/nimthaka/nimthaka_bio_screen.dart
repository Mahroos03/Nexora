import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Design Style: Light Editorial & Tactical Sports-Tech Bento Architecture
/// Distinctive features: Crisp daylight palette, geometric pitch-grid header,
/// pinned segmented tab switcher, vertical timeline steppers,
/// Bento skill matrix, and floating bottom contact dock.
class NimthakaBioScreen extends StatefulWidget {
  const NimthakaBioScreen({super.key});

  @override
  State<NimthakaBioScreen> createState() => _NimthakaBioScreenState();
}

class _NimthakaBioScreenState extends State<NimthakaBioScreen> {
  // Color Palette: Daylight Editorial, Deep Slate & Cobalt / Pitch Green
  static const Color bgCanvas = Color(0xFFF8FAFC);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color inkPrimary = Color(0xFF0F172A);
  static const Color inkSecondary = Color(0xFF475569);
  static const Color borderSubtle = Color(0xFFE2E8F0);
  static const Color cobaltPrimary = Color(0xFF2563EB);
  static const Color pitchGreen = Color(0xFF16A34A);
  static const Color violetAccent = Color(0xFF7C3AED);

  int _activeTabIndex = 0;
  String _projectFilter = 'All';
  bool _isShortlisted = false;

  static const List<String> _tabs = <String>[
    'Overview',
    'Experience',
    'Projects',
    'Skills',
  ];

  // CV Data Models
  final String fullName = 'Nimthaka Geenath';
  final String initials = 'NG';
  final String role = 'Fullstack Developer';
  final String location = 'Gampaha, Sri Lanka';
  final String phone = '+94 717010905';
  final String email = 'nimthakageenathd2002@gmail.com';
  final String portfolio = 'portfolio';
  final String linkedin = 'Nimthaka Geenath';
  final String github = 'nimthakalkp';

  final String careerObjective =
      'I am an Information Technology student at the Institute of Technology, '
      'University of Moratuwa (ITUM), with a strong interest in software '
      'development, data analytics, and sports performance analysis. I am '
      'developing my skills in JavaScript, React, Node.js, databases, machine '
      'learning, and web application development through academic projects and '
      'practical experience. Alongside technology, I have a strong passion for '
      'sports and aim to combine my IT knowledge with sports performance '
      'analysis, focusing on areas such as football tactics, performance data, '
      'and video analysis. I am a motivated and continuously learning individual '
      'who enjoys solving problems, gaining practical experience, and '
      'developing both technical and professional skills, with the long-term '
      'goal of building a successful career in IT and sports performance analysis.';

  final List<Map<String, String>> focusAreas = <Map<String, String>>[
    <String, String>{
      'title': 'Fullstack Dev',
      'subtitle': 'JS • Node.js • Flutter',
    },
    <String, String>{
      'title': 'Sports Analytics',
      'subtitle': 'Football Tactics & Data',
    },
    <String, String>{
      'title': 'Backend APIs',
      'subtitle': 'Express • REST • DBs',
    },
    <String, String>{
      'title': 'Machine Learning',
      'subtitle': 'Academic & Data Models',
    },
  ];

  final List<Map<String, String>> education = <Map<String, String>>[
    <String, String>{
      'program': 'Information Technology',
      'institution': 'Institute of Technology, University of Moratuwa',
      'period': 'Expected 2027',
      'location': 'Sri Lanka',
    },
    <String, String>{
      'program': 'GCE Advanced Level Examination – Physical Science',
      'institution': 'Bandaranayake Central College',
      'period': '2017 – 2020',
      'location': 'Sri Lanka',
    },
  ];

  final Map<String, List<String>> technicalSkills = <String, List<String>>{
    'Languages': <String>[
      'Dart',
      'Java',
      'Python',
      'JavaScript',
      'TypeScript',
      'HTML/CSS',
    ],
    'Frameworks & Libraries': <String>[
      'Flutter',
      'React Native',
      'Spring Boot',
    ],
    'Database Systems': <String>[
      'MySQL',
      'MongoDB',
      'Firebase',
    ],
    'Tools & Platforms': <String>[
      'Android Studio',
      'VS Code',
      'Git',
      'GitHub',
      'Postman',
    ],
  };

  final List<Map<String, dynamic>> workExperience = <Map<String, dynamic>>[
    <String, dynamic>{
      'role': 'Data Entry Operator',
      'company': 'Sri Lanka Insurance',
      'period': 'Jan 2024 – Jan 2025',
      'location': 'Colombo',
      'highlights': <String>[
        'Entered and updated information accurately in relevant records and systems.',
        'Worked with spreadsheets to organize and manage information.',
        'Assisted with document processing and maintaining organized records.',
        'Demonstrated attention to detail, accuracy, and responsibility when completing assigned tasks.',
        'Developed data management, organizational, and time management skills in a professional working environment.',
      ],
    },
  ];

  final List<Map<String, dynamic>> projects = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'ChildGuard – IoT-Based Child Safety Monitoring System',
      'role': 'Academic Team Project – Backend Developer',
      'year': '2026',
      'category': 'Academic',
      'tags': <String>['JavaScript', 'Node.js', 'Express.js', 'REST API', 'IoT'],
      'highlights': <String>[
        'Contributing to the development of an IoT-based child safety monitoring system connecting hardware devices with a software application.',
        'Working on backend development using JavaScript, Node.js, and Express.js.',
        'Developing server-side functionality and REST API endpoints to support communication between application components.',
      ],
    },
    <String, dynamic>{
      'title': 'Football Analysis App',
      'role': 'Personal Project',
      'year': '2026',
      'category': 'Personal',
      'tags': <String>['JavaScript', 'Node.js', 'Express.js', 'Sports Data'],
      'highlights': <String>[
        'Developing a football analysis application for recording and retrieving match events.',
        'Built backend functionality using JavaScript, Node.js, and Express.js.',
        'Implemented REST API endpoints, input validation, and event data handling.',
      ],
    },
    <String, dynamic>{
      'title': 'Mood Flow – Music Recognition System',
      'role': 'Academic Team Project – Team Member',
      'year': '2026',
      'category': 'Academic',
      'tags': <String>['Team Collaboration', 'Audio / Music Tech'],
      'highlights': <String>[
        'Collaborated as a team member on a music recognition project.',
        'Contributed to the development of the project as part of a collaborative software development team.',
      ],
    },
    <String, dynamic>{
      'title': 'Machine Learning Project',
      'role': 'Academic Project',
      'year': '2026',
      'category': 'Academic',
      'tags': <String>['Machine Learning', 'Python', 'Data Analytics'],
      'highlights': <String>[],
    },
  ];

  List<Map<String, dynamic>> get _filteredProjects {
    if (_projectFilter == 'All') return projects;
    return projects
        .where((Map<String, dynamic> p) => p['category'] == _projectFilter)
        .toList();
  }

  void _copyValue(String label, String value) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            const Icon(Icons.check_circle_rounded, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Copied $label: $value',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: inkPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showContactSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: surfaceWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext sheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: borderSubtle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Direct Contact & Profiles',
                style: TextStyle(
                  color: inkPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Tap any item to copy to clipboard',
                style: TextStyle(color: inkSecondary, fontSize: 12.5),
              ),
              const SizedBox(height: 16),
              _buildContactTile(Icons.email_outlined, 'Email', email, cobaltPrimary),
              _buildContactTile(Icons.phone_outlined, 'Phone', phone, pitchGreen),
              _buildContactTile(Icons.language_rounded, 'Portfolio', portfolio, violetAccent),
              _buildContactTile(Icons.work_outline_rounded, 'LinkedIn', linkedin, cobaltPrimary),
              _buildContactTile(Icons.code_rounded, 'GitHub', github, inkPrimary),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCanvas,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildEditorialHeader(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SegmentedTabDelegate(
              tabs: _tabs,
              activeIndex: _activeTabIndex,
              onSelect: (int index) => setState(() => _activeTabIndex = index),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
            sliver: SliverToBoxAdapter(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: KeyedSubtree(
                  key: ValueKey<int>(_activeTabIndex),
                  child: _buildActiveTabBody(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomActionDock(),
    );
  }

  Widget _buildEditorialHeader() {
    return SliverAppBar(
      expandedHeight: 235,
      pinned: true,
      elevation: 0,
      backgroundColor: surfaceWhite,
      surfaceTintColor: surfaceWhite,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: inkPrimary),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'Curriculum Vitae',
        style: TextStyle(
          color: inkPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: <Widget>[
        IconButton(
          tooltip: 'Contact Links',
          icon: const Icon(Icons.alternate_email_rounded, color: cobaltPrimary),
          onPressed: _showContactSheet,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(color: surfaceWhite),
            CustomPaint(painter: _TacticalGridPainter()),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 56, 18, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: <Color>[cobaltPrimary, Color(0xFF1D4ED8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: cobaltPrimary.withValues(alpha: 0.25),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            initials,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: pitchGreen.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: pitchGreen.withValues(alpha: 0.35),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.sports_soccer_rounded,
                                      size: 12,
                                      color: pitchGreen,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'IT & SPORTS ANALYTICS',
                                      style: TextStyle(
                                        color: pitchGreen,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                fullName,
                                style: const TextStyle(
                                  color: inkPrimary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                role,
                                style: const TextStyle(
                                  color: cobaltPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: <Widget>[
                        _buildHeaderPill(Icons.location_on_outlined, location),
                        _buildHeaderPill(Icons.school_outlined, 'ITUM • 2027'),
                        _buildHeaderPill(Icons.code_rounded, github),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderPill(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgCanvas,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 13, color: inkSecondary),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: inkPrimary,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveTabBody() {
    switch (_activeTabIndex) {
      case 0:
        return _buildOverviewTab();
      case 1:
        return _buildExperienceAndEducationTab();
      case 2:
        return _buildProjectsTab();
      case 3:
        return _buildSkillsTab();
      default:
        return _buildOverviewTab();
    }
  }

  // TAB 1: Overview (Career Objective + Bento Focus Areas + Quick Links)
  Widget _buildOverviewTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionLabel('CAREER OBJECTIVE'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: surfaceWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderSubtle),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      color: cobaltPrimary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'About & Long-Term Goal',
                    style: TextStyle(
                      color: inkPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                careerObjective,
                style: const TextStyle(
                  color: inkSecondary,
                  fontSize: 13.5,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionLabel('CORE FOCUS'),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: focusAreas.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.95,
          ),
          itemBuilder: (BuildContext context, int index) {
            final Map<String, String> item = focusAreas[index];
            final List<Color> accents = <Color>[
              cobaltPrimary,
              pitchGreen,
              violetAccent,
              const Color(0xFFEA580C),
            ];
            final Color accent = accents[index % accents.length];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: surfaceWhite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item['title'] ?? '',
                    style: TextStyle(
                      color: accent,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['subtitle'] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: inkSecondary,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        _buildSectionLabel('CONNECT & PROFILES'),
        Container(
          decoration: BoxDecoration(
            color: surfaceWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderSubtle),
          ),
          child: Column(
            children: <Widget>[
              _buildContactTile(Icons.email_outlined, 'Email', email, cobaltPrimary),
              const Divider(height: 1, color: borderSubtle),
              _buildContactTile(Icons.phone_outlined, 'Phone', phone, pitchGreen),
              const Divider(height: 1, color: borderSubtle),
              _buildContactTile(Icons.language_rounded, 'Portfolio', portfolio, violetAccent),
              const Divider(height: 1, color: borderSubtle),
              _buildContactTile(Icons.work_outline_rounded, 'LinkedIn', linkedin, cobaltPrimary),
              const Divider(height: 1, color: borderSubtle),
              _buildContactTile(Icons.code_rounded, 'GitHub', github, inkPrimary),
            ],
          ),
        ),
      ],
    );
  }

  // TAB 2: Experience & Education (Timeline Steppers)
  Widget _buildExperienceAndEducationTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionLabel('WORK EXPERIENCE'),
        ...workExperience.map<Widget>(_buildWorkCard),
        const SizedBox(height: 20),
        _buildSectionLabel('EDUCATION'),
        ...education.asMap().entries.map<Widget>((
          MapEntry<int, Map<String, String>> entry,
        ) {
          final bool isLast = entry.key == education.length - 1;
          return _buildEducationTimelineItem(entry.value, isLast: isLast);
        }),
      ],
    );
  }

  Widget _buildWorkCard(Map<String, dynamic> job) {
    final List<String> bullets =
        (job['highlights'] as List<dynamic>).cast<String>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cobaltPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.business_center_rounded,
                  color: cobaltPrimary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      (job['role'] ?? '') as String,
                      style: const TextStyle(
                        color: inkPrimary,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${job['company']} • ${job['location']}',
                      style: const TextStyle(
                        color: inkSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: bgCanvas,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderSubtle),
                ),
                child: Text(
                  (job['period'] ?? '') as String,
                  style: const TextStyle(
                    color: inkPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: borderSubtle),
          const SizedBox(height: 12),
          ...bullets.map<Widget>(
            (String bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 6, color: cobaltPrimary),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      bullet,
                      style: const TextStyle(
                        color: inkSecondary,
                        fontSize: 13,
                        height: 1.45,
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

  Widget _buildEducationTimelineItem(
    Map<String, String> edu, {
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: 26,
            child: Column(
              children: <Widget>[
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: surfaceWhite,
                    shape: BoxShape.circle,
                    border: Border.all(color: pitchGreen, width: 3.5),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: borderSubtle,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: surfaceWhite,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: pitchGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          edu['period'] ?? '',
                          style: const TextStyle(
                            color: pitchGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        edu['location'] ?? '',
                        style: const TextStyle(
                          color: inkSecondary,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    edu['program'] ?? '',
                    style: const TextStyle(
                      color: inkPrimary,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    edu['institution'] ?? '',
                    style: const TextStyle(
                      color: inkSecondary,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
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

  // TAB 3: Projects (Filterable Cards)
  Widget _buildProjectsTab() {
    final List<String> filters = <String>['All', 'Academic', 'Personal'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildSectionLabel('PROJECTS (${_filteredProjects.length})'),
            Row(
              children: filters.map<Widget>((String filter) {
                final bool selected = _projectFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => _projectFilter = filter),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? inkPrimary : surfaceWhite,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? inkPrimary : borderSubtle,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: selected ? Colors.white : inkSecondary,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        ..._filteredProjects.map<Widget>(_buildProjectCard),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    final List<String> tags = (project['tags'] as List<dynamic>).cast<String>();
    final List<String> highlights =
        (project['highlights'] as List<dynamic>).cast<String>();
    final bool isPersonal = project['category'] == 'Personal';
    final Color badgeColor = isPersonal ? pitchGreen : cobaltPrimary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  (project['year'] ?? '') as String,
                  style: TextStyle(
                    color: badgeColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  (project['role'] ?? '') as String,
                  style: const TextStyle(
                    color: inkSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.code_rounded, size: 18, color: badgeColor),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            (project['title'] ?? '') as String,
            style: const TextStyle(
              color: inkPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (highlights.isNotEmpty) ...<Widget>[
            const SizedBox(height: 10),
            ...highlights.map<Widget>(
              (String point) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '• ',
                      style: TextStyle(
                        color: badgeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          color: inkSecondary,
                          fontSize: 12.8,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags.map<Widget>((String tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: bgCanvas,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderSubtle),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: inkPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // TAB 4: Technical Skills Matrix
  Widget _buildSkillsTab() {
    final List<IconData> icons = <IconData>[
      Icons.terminal_rounded,
      Icons.layers_outlined,
      Icons.storage_rounded,
      Icons.build_circle_outlined,
    ];
    final List<Color> colors = <Color>[
      cobaltPrimary,
      violetAccent,
      pitchGreen,
      const Color(0xFFEA580C),
    ];

    final List<MapEntry<String, List<String>>> entries =
        technicalSkills.entries.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionLabel('TECHNICAL STACK MATRIX'),
        ...entries.asMap().entries.map<Widget>((
          MapEntry<int, MapEntry<String, List<String>>> item,
        ) {
          final int idx = item.key;
          final String category = item.value.key;
          final List<String> skills = item.value.value;
          final Color accent = colors[idx % colors.length];
          final IconData icon = icons[idx % icons.length];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: surfaceWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderSubtle),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, size: 18, color: accent),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: inkPrimary,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      '${skills.length}',
                      style: TextStyle(
                        color: accent,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills.map<Widget>((String skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: bgCanvas,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          color: inkPrimary,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: inkSecondary,
          fontSize: 11.5,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildContactTile(
    IconData icon,
    String label,
    String value,
    Color accent,
  ) {
    return InkWell(
      onTap: () => _copyValue(label, value),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 17, color: accent),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: const TextStyle(
                      color: inkSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: inkPrimary,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.copy_rounded, size: 16, color: inkSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionDock() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: const BoxDecoration(
        color: surfaceWhite,
        border: Border(top: BorderSide(color: borderSubtle)),
      ),
      child: Row(
        children: <Widget>[
          OutlinedButton.icon(
            onPressed: () => _copyValue('Email', email),
            style: OutlinedButton.styleFrom(
              foregroundColor: inkPrimary,
              side: const BorderSide(color: borderSubtle),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.mail_outline_rounded, size: 18),
            label: const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => setState(() => _isShortlisted = !_isShortlisted),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isShortlisted ? pitchGreen : cobaltPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(
                _isShortlisted
                    ? Icons.bookmark_added_rounded
                    : Icons.bookmark_add_outlined,
                size: 18,
              ),
              label: Text(
                _isShortlisted ? 'Candidate Shortlisted' : 'Shortlist Candidate',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentedTabDelegate extends SliverPersistentHeaderDelegate {
  const _SegmentedTabDelegate({
    required this.tabs,
    required this.activeIndex,
    required this.onSelect,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: _NimthakaBioScreenState.surfaceWhite,
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _NimthakaBioScreenState.bgCanvas,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _NimthakaBioScreenState.borderSubtle),
        ),
        child: Row(
          children: tabs.asMap().entries.map<Widget>((
            MapEntry<int, String> entry,
          ) {
            final bool selected = entry.key == activeIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => onSelect(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected
                        ? _NimthakaBioScreenState.surfaceWhite
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: selected
                        ? <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    entry.value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected
                          ? _NimthakaBioScreenState.inkPrimary
                          : _NimthakaBioScreenState.inkSecondary,
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SegmentedTabDelegate oldDelegate) {
    return oldDelegate.activeIndex != activeIndex || oldDelegate.tabs != tabs;
  }
}

class _TacticalGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint gridPaint = Paint()
      ..color = const Color(0xFFE2E8F0).withValues(alpha: 0.55)
      ..strokeWidth = 1;

    const double step = 28;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final Paint pitchAccent = Paint()
      ..color = const Color(0xFF16A34A).withValues(alpha: 0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(size.width - 36, 78), 52, pitchAccent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
