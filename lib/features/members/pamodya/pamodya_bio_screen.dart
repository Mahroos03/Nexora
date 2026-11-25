import 'package:flutter/material.dart';

class PamodyaBioScreen extends StatefulWidget {
  const PamodyaBioScreen({super.key});

  @override
  State<PamodyaBioScreen> createState() => _PamodyaBioScreenState();
}

class _PamodyaBioScreenState extends State<PamodyaBioScreen> {
  // State Management variables (Criteria 5: State Management)
  bool _isDarkMode = false;
  bool _isLiked = false;
  int _likeCount = 24;
  int _selectedTabIndex = 0; // 0: Academics, 1: Skills & Talents

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic theme colors based on state
    final bgColor = _isDarkMode ? const Color(0xFF121212) : const Color(0xFFF4F6FA);
    final cardColor = _isDarkMode ? const Color(0xFF1E1E2C) : Colors.white;
    final textColor = _isDarkMode ? Colors.white : const Color(0xFF1A1D2E);
    final subTextColor = _isDarkMode ? Colors.grey[400]! : Colors.grey[700]!;
    const primaryAccent = Color(0xFF6C63FF);
    const secondaryAccent = Color(0xFFFF6584);

    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          // 1. Unique SliverAppBar with Gradient Header & Theme Toggle
          SliverAppBar(
            expandedHeight: 220.0,
            pinned: true,
            backgroundColor: primaryAccent,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                tooltip: _isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: _toggleTheme,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    // Profile Photograph with Decorative Ring
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage('assets/images/pamodya.jpg'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Pamodya Nethmi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Text(
                      'UI/UX Designer & Frontend Developer',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Main Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact & Basic Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          Icons.person_outline,
                          'Full Name',
                          'Pamodya Nethmi',
                          primaryAccent,
                          textColor,
                          subTextColor,
                        ),
                        const Divider(height: 20),
                        _buildInfoRow(
                          Icons.location_on_outlined,
                          'Address',
                          'No.04 Quarters, CEB, Deniyaya, Sri Lanka',
                          secondaryAccent,
                          textColor,
                          subTextColor,
                        ),
                        const Divider(height: 20),
                        _buildInfoRow(
                          Icons.email_outlined,
                          'Email Address',
                          'pamodyanethmi2002@gmail.com', 
                          Colors.teal,
                          textColor,
                          subTextColor,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Interactive Like / Endorse Bar (State Management)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _isLiked ? secondaryAccent : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Appreciate Profile',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _toggleLike,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isLiked ? secondaryAccent : primaryAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                          ),
                          label: Text('$_likeCount Likes'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Custom Segmented Tab Switcher (State Management)
                  Row(
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          title: 'Academics',
                          index: 0,
                          primaryAccent: primaryAccent,
                          cardColor: cardColor,
                          textColor: textColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTabButton(
                          title: 'Skills & Talents',
                          index: 1,
                          primaryAccent: primaryAccent,
                          cardColor: cardColor,
                          textColor: textColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Dynamic Content Area based on Selected Tab
                  if (_selectedTabIndex == 0)
                    _buildAcademicsSection(cardColor, textColor, subTextColor, primaryAccent)
                  else
                    _buildSkillsAndTalentsSection(cardColor, textColor, subTextColor, primaryAccent, secondaryAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    Color iconColor,
    Color textColor,
    Color subTextColor,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: subTextColor)),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required String title,
    required int index,
    required Color primaryAccent,
    required Color cardColor,
    required Color textColor,
  }) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? primaryAccent : cardColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryAccent.withOpacity(0.35),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAcademicsSection(
    Color cardColor,
    Color textColor,
    Color subTextColor,
    Color accentColor,
  ) {
    final qualifications = [
      {
        'title': 'National Diploma in Technology (NDT) in IT',
        'institute': 'Institute of Technology, University of Moratuwa',
        'year': '2025 - Present (GPA: 3.15)',
      },
      {
        'title': 'G.C.E. Advanced Level (Physical Science)',
        'institute': 'Completed with B, C, S passes',
        'year': '2022',
      },
      {
        'title': 'G.C.E. Ordinary Level',
        'institute': '8 As and 1 B pass',
        'year': '2018',
      },
      {
        'title': 'Professional Certifications',
        'institute': 'Open UOM (Python, Web Design, Front-End, QA) & Coursera Digital Marketing',
        'year': '2025 - 2026',
      },
    ];

    return Column(
      children: qualifications.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border(left: BorderSide(color: accentColor, width: 4)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.school_outlined, color: accentColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['institute']!,
                      style: TextStyle(fontSize: 13, color: subTextColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['year']!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkillsAndTalentsSection(
    Color cardColor,
    Color textColor,
    Color subTextColor,
    Color primaryAccent,
    Color secondaryAccent,
  ) {
    final softSkills = [
      'Teamwork & Collaboration',
      'Effective Communication',
      'Problem Solving',
      'Time Management',
      'Leadership',
      'Adaptability',
    ];

    final specialTalents = [
      {'icon': Icons.palette_outlined, 'title': 'UI/UX Prototyping (Figma & Adobe Suite)'},
      {'icon': Icons.auto_stories_outlined, 'title': 'Children\'s Storybook Author (Amazon KDP)'},
      {'icon': Icons.web_outlined, 'title': 'Full-Stack Web & Flutter App Development'},
      {'icon': Icons.sports_tennis, 'title': 'Table Tennis Coordinator in ITUM (Sports)'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Soft Skills Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Soft Skills',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: softSkills.map((skill) {
                  return Chip(
                    label: Text(
                      skill,
                      style: TextStyle(
                        color: primaryAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: primaryAccent.withOpacity(0.12),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Special Talents Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Special Talents & Hobbies',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 12),
              ...specialTalents.map((talent) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Icon(talent['icon'] as IconData, color: secondaryAccent, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          talent['title'] as String,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}