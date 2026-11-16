import 'package:flutter/material.dart';

class MahroosBioScreen extends StatelessWidget {
  const MahroosBioScreen({super.key});

  static const Color background = Color(0xFF0B1020);
  static const Color primary = Color(0xFF6685FF);
  static const Color cardColor = Color(0xFF151D32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navigation
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'NEXORA / PROFILE',
                    style: TextStyle(
                      color: Colors.white54,
                      letterSpacing: 2,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Profile Header
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primary,
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 65,
                        backgroundColor: cardColor,
                        child: Icon(
                          Icons.person,
                          size: 75,
                          color: primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),

                    const Text(
                      'MOHAMED MAHROOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'NDT Information Technology Student',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Passionate about software development, '
                      'networking and emerging technologies.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        height: 1.6,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // About Me
              _sectionTitle('ABOUT ME'),

              _infoCard(
                child: const Text(
                  'I am an Information Technology student at the '
                  'Institute of Technology, University of Moratuwa. '
                  'I enjoy building practical software solutions, '
                  'exploring new technologies and solving real-world '
                  'problems through technology.',
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.8,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Education
              _sectionTitle('EDUCATION'),

              _infoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _timelineItem(
                      'National Diploma in Technology',
                      'Institute of Technology, University of Moratuwa',
                    ),
                    const SizedBox(height: 22),
                    _timelineItem(
                      'G.C.E. Ordinary Level',
                      'P/Erukkalampitty M.M.V.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Technical Skills
              _sectionTitle('TECHNICAL SKILLS'),

              _infoCard(
                child: Wrap(
                  spacing: 9,
                  runSpacing: 11,
                  children: [
                    'Java',
                    'Spring Boot',
                    'React.js',
                    'PHP',
                    'JavaScript',
                    'Node.js',
                    'Flutter',
                    'HTML',
                    'CSS',
                    'MySQL',
                    'PostgreSQL',
                    'Python',
                    'Git',
                  ].map((skill) => _skillChip(skill)).toList(),
                ),
              ),

              const SizedBox(height: 25),

              // Soft Skills
              _sectionTitle('SOFT SKILLS'),

              _infoCard(
                child: Column(
                  children: [
                    _skillRow(Icons.groups_outlined, 'Teamwork'),
                    _skillRow(Icons.lightbulb_outline, 'Problem Solving'),
                    _skillRow(Icons.forum_outlined, 'Communication'),
                    _skillRow(Icons.leaderboard_outlined, 'Leadership'),
                    _skillRow(Icons.auto_awesome_outlined, 'Adaptability'),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Interests
              _sectionTitle('INTERESTS & TALENTS'),

              _infoCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InterestItem(
                      Icons.code,
                      'Software Development',
                    ),
                    _InterestItem(
                      Icons.computer,
                      'Technology & Innovation',
                    ),
                    _InterestItem(
                      Icons.sports_soccer,
                      'Football',
                    ),
                    _InterestItem(
                      Icons.network_check,
                      'Networking',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Footer
              const Center(
                child: Column(
                  children: [
                    Text(
                      'NEXORA',
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Nine identities. One connection.',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _infoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: child,
    );
  }

  static Widget _skillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primary.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget _timelineItem(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.school_outlined,
          color: primary,
          size: 23,
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _skillRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: primary, size: 21),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InterestItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _InterestItem(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6685FF), size: 21),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
