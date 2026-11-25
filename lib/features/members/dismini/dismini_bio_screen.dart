import 'package:flutter/material.dart';

class DisminiBioScreen extends StatelessWidget {
  const DisminiBioScreen({super.key});

  static const Color navy = Color(0xFF172554);
  static const Color lavender = Color(0xFFC4B5FD);
  static const Color background = Color(0xFFF8F7FF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: const BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [
                  // PROFILE PHOTO
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: lavender,
                    ),

                    child: const CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/dismini.png'),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'M.D. Mihirandani',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'IT Undergraduate',
                    style: TextStyle(fontSize: 16, color: lavender),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Aspiring Full Stack Developer | UI/UX Designer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ABOUT ME
                  sectionTitle('About Me', Icons.person_outline),

                  infoCard(
                    child: const Text(
                      'I am an IT undergraduate at the Institute of Technology, '
                      'University of Moratuwa. I am passionate about UI/UX design '
                      'and software development. I enjoy creating simple, attractive '
                      'and user-friendly digital experiences.',
                      style: TextStyle(fontSize: 14, height: 1.7, color: navy),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // EDUCATION
                  sectionTitle(
                    'Academic Qualifications',
                    Icons.school_outlined,
                  ),

                  infoCard(
                    child: Column(
                      children: const [
                        EducationItem(
                          'IT Undergraduate',
                          'Institute of Technology, University of Moratuwa',
                        ),
                        EducationItem(
                          'Diploma in Information Technology',
                          'Esoft Metro Campus',
                        ),
                        EducationItem(
                          'Diploma in English',
                          'Esoft Metro Campus',
                        ),
                        EducationItem(
                          'G.C.E. Advanced Level',
                          'Vihara Mahadevi Girl,s School, Kandy',
                        ),
                        EducationItem(
                          'G.C.E. Ordinary Level',
                          'Vihara Mahadevi Girl,s School, Kandy',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // TECHNICAL SKILLS
                  sectionTitle('Technical Skills', Icons.code),

                  infoCard(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: const [
                        SkillChip('HTML'),
                        SkillChip('CSS'),
                        SkillChip('JavaScript'),
                        SkillChip('React.js'),
                        SkillChip('Bootstrap'),
                        SkillChip('MySQL'),
                        SkillChip('Java'),
                        SkillChip('Figma'),
                        SkillChip('Git & GitHub'),
                        SkillChip('Flutter & Dart'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // SOFT SKILLS
                  sectionTitle('Soft Skills', Icons.star_outline),

                  infoCard(
                    child: Column(
                      children: const [
                        SoftSkillItem(Icons.forum_outlined, 'Communication'),
                        SoftSkillItem(Icons.groups_outlined, 'Teamwork'),
                        SoftSkillItem(Icons.access_time, 'Time Management'),
                        SoftSkillItem(Icons.sync, 'Adaptability'),
                        SoftSkillItem(
                          Icons.lightbulb_outline,
                          'Problem Solving',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // INTERESTS
                  sectionTitle('Interests & Hobbies', Icons.favorite_outline),

                  infoCard(
                    child: Column(
                      children: const [
                        InterestItem(Icons.design_services, 'UI/UX Designing'),
                        InterestItem(Icons.web, 'Web Development'),
                        InterestItem(
                          Icons.phone_android,
                          'Mobile App Development',
                        ),
                        InterestItem(
                          Icons.computer,
                          'Learning New Technologies',
                        ),
                        InterestItem(
                          Icons.music_note,
                          'Playing Musical Instruments',
                        ),
                        InterestItem(Icons.movie, 'Watching Movies'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // CAREER GOAL
                  sectionTitle('Career Goal', Icons.flag_outlined),

                  infoCard(
                    child: const Text(
                      'My goal is to become a skilled software '
                      'developer who creates innovative, efficient '
                      'and user-friendly applications while '
                      'continuously improving my technical and '
                      'professional abilities.',
                      style: TextStyle(fontSize: 14, height: 1.7, color: navy),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // CONTACT
                  sectionTitle(
                    'Contact Information',
                    Icons.contact_mail_outlined,
                  ),

                  infoCard(
                    child: Column(
                      children: const [
                        InterestItem(
                          Icons.location_on_outlined,
                          'Kandy, Sri Lanka',
                        ),
                        InterestItem(
                          Icons.email_outlined,
                          'mihirandanimahalekam@gmail.com',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // FOOTER
                  const Center(
                    child: Text(
                      'Designed with passion 💜',
                      style: TextStyle(
                        color: navy,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  static Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          Icon(icon, color: navy, size: 23),

          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
        ],
      ),
    );
  }

  // INFORMATION CARD
  static Widget infoCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: lavender.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: navy.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: child,
    );
  }
}

// EDUCATION ITEM
class EducationItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const EducationItem(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school, color: DisminiBioScreen.lavender),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: DisminiBioScreen.navy,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SKILL CHIP
class SkillChip extends StatelessWidget {
  final String title;

  const SkillChip(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),

      decoration: BoxDecoration(
        color: const Color(0xFFEDE9FE),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        title,
        style: const TextStyle(
          color: DisminiBioScreen.navy,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

// SOFT SKILL ITEM
class SoftSkillItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SoftSkillItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Row(
        children: [
          Icon(icon, color: DisminiBioScreen.navy),

          const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(fontSize: 14, color: DisminiBioScreen.navy),
          ),
        ],
      ),
    );
  }
}

// INTEREST ITEM
class InterestItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const InterestItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Row(
        children: [
          Icon(icon, color: DisminiBioScreen.navy),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: DisminiBioScreen.navy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
