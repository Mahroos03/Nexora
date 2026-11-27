import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DilkiBioScreen extends StatefulWidget {
  const DilkiBioScreen({super.key});

  @override
  State<DilkiBioScreen> createState() => _DilkiBioScreenState();
}

class _DilkiBioScreenState extends State<DilkiBioScreen>
    with SingleTickerProviderStateMixin {

  static const String _name = 'Dilki Ishara Nanayakkara';
  static const String _role = 'Aspiring Software Engineer (Full-Stack & Data)';
  static const String _address = 'Galle, Sri Lanka';
  static const String _email = 'dilkinanayakkara39@gmail.com';
  static const String _photoPath = 'assets/images/dilki.jpg';
  static const String _summary =
      'Information Technology undergraduate at the University of Moratuwa, '
      'skilled in Java, Spring Boot, React, Node.js and Python. I have built '
      'secure REST APIs, a full-stack tourism web app in a team of five, and '
      'data pipelines on PostgreSQL.';


  static const String? _heroBackgroundPath = null;

 
  static const double _photoZoom = 1.8;
  static const Alignment _photoFocus = Alignment(0, 0.6);

  static const List<_Qualification> _qualifications = [
    _Qualification(
      title: 'Diploma in Information Technology',
      institution: 'Institute of Technology, University of Moratuwa',
      period: '2025 - Present',
      result: 'Currently in Semester 4, CGPA 3.51 (after Semester 3)',
    ),
    _Qualification(
      title: 'G.C.E. Advanced Level',
      institution: 'Sanghamiththa Balika Vidyalaya',
      period: '2021',
      result: '3 A passes',
    ),
    _Qualification(
      title: 'G.C.E. Ordinary Level',
      institution: 'Sanghamiththa Balika Vidyalaya',
      period: '2018',
      result: '9 A passes',
    ),
    _Qualification(
      title: 'Machine Learning with Python',
      institution: 'freeCodeCamp',
      period: 'Certificate',
      result: 'Online certification',
    ),
    _Qualification(
      title: '100 Projects Completed',
      institution: 'DP Education Coding School',
      period: 'Certificate',
      result: 'App Development & Computer Science',
    ),
  ];

  static const List<_Skill> _softSkills = [
    _Skill('Teamwork', Icons.groups, 0.9),
    _Skill('Communication', Icons.record_voice_over, 0.85),
    _Skill('Public Speaking', Icons.mic, 0.8),
    _Skill('Time Management', Icons.schedule, 0.8),
  ];

  static const List<_Talent> _talents = [
    _Talent(Icons.code, 'Coding'),
    _Talent(Icons.mic, 'Public Speaking'),
    _Talent(Icons.music_note, 'Music'),
    _Talent(Icons.sports_basketball, 'Sports'),
  ];


  late final TabController _tabController;
  bool _isFavourite = false;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _copyEmail() async {
    await Clipboard.setData(const ClipboardData(text: _email));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Email copied to clipboard'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

 
  @override
  Widget build(BuildContext context) {
    final palette = _isDark ? _Palette.dark : _Palette.light;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [palette.background, palette.backgroundEnd],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildHero(palette),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    child: Column(
                      children: [
                        _buildStats(palette),
                        const SizedBox(height: 16),
                        _buildTabBar(palette),
                        const SizedBox(height: 16),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: KeyedSubtree(
                            key: ValueKey<int>(_tabController.index),
                            child: _buildTabContent(palette),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(_Palette palette) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 460,
      backgroundColor: palette.accent,
      foregroundColor: Colors.white,
      leading: IconButton(
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        IconButton(
          tooltip: _isDark ? 'Switch to light mode' : 'Switch to dark mode',
          icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: () => setState(() => _isDark = !_isDark),
        ),
        IconButton(
          tooltip: 'Favourite',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              _isFavourite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey<bool>(_isFavourite),
              color: _isFavourite ? palette.accent2 : Colors.white,
            ),
          ),
          onPressed: () => setState(() => _isFavourite = !_isFavourite),
        ),
        const SizedBox(width: 4),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildHeroBackground(palette),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildProfilePhoto(palette),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'MEMBER #2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      _name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      _role,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
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

  Widget _buildHeroBackground(_Palette palette) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: palette.heroGradient,
            ),
          ),
        ),
        if (_heroBackgroundPath != null)
          Image.asset(
            _heroBackgroundPath!,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        if (_heroBackgroundPath != null)
          DecoratedBox(
            decoration: BoxDecoration(
              color: palette.heroGradient.first.withValues(alpha: 0.55),
            ),
          ),
        const CustomPaint(painter: _HeroPatternPainter()),
      ],
    );
  }

  Widget _buildProfilePhoto(_Palette palette) {
    const double size = 170;
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [Colors.white, palette.accent2]),
        boxShadow: [
          BoxShadow(
            color: palette.accent2.withValues(alpha: 0.5),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Transform.scale(
          scale: _photoZoom,
          alignment: _photoFocus,
          child: Image.asset(
            _photoPath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              color: palette.chip,
              child: Icon(Icons.person, size: 80, color: palette.accent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStats(_Palette palette) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            palette: palette,
            value: '${_qualifications.length}',
            label: 'Qualifications',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatTile(
            palette: palette,
            value: '${_softSkills.length}',
            label: 'Soft Skills',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatTile(
            palette: palette,
            value: '${_talents.length}',
            label: 'Talents',
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(_Palette palette) {
    return Container(
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(4),
      child: TabBar(
        controller: _tabController,
        onTap: (_) => setState(() {}),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          gradient: LinearGradient(colors: [palette.accent, palette.accent2]),
          borderRadius: BorderRadius.circular(12),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: palette.subText,
        labelStyle: const TextStyle(fontWeight: FontWeight.w700),
        tabs: const [
          Tab(icon: Icon(Icons.person), text: 'About'),
          Tab(icon: Icon(Icons.school), text: 'Education'),
          Tab(icon: Icon(Icons.auto_awesome), text: 'Skills'),
        ],
      ),
    );
  }

  Widget _buildTabContent(_Palette palette) {
    switch (_tabController.index) {
      case 0:
        return _buildAboutTab(palette);
      case 1:
        return _buildEducationTab(palette);
      default:
        return _buildSkillsTab(palette);
    }
  }

  Widget _buildAboutTab(_Palette palette) {
    return Column(
      children: [
        _SectionCard(
          palette: palette,
          title: 'About Me',
          icon: Icons.person,
          child: Text(
            _summary,
            style: TextStyle(color: palette.text, height: 1.5),
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          palette: palette,
          title: 'Contact',
          icon: Icons.contact_mail,
          child: Column(
            children: [
              _ContactRow(
                palette: palette,
                icon: Icons.location_on,
                label: 'Address',
                value: _address,
              ),
              const SizedBox(height: 12),
              _ContactRow(
                palette: palette,
                icon: Icons.email,
                label: 'Email',
                value: _email,
                trailing: IconButton(
                  tooltip: 'Copy email',
                  icon: Icon(Icons.copy, color: palette.accent),
                  onPressed: _copyEmail,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEducationTab(_Palette palette) {
    return _SectionCard(
      palette: palette,
      title: 'Academic Qualifications',
      icon: Icons.school,
      child: Column(
        children: [
          for (var i = 0; i < _qualifications.length; i++)
            _TimelineItem(
              palette: palette,
              qualification: _qualifications[i],
              isLast: i == _qualifications.length - 1,
              initiallyExpanded: i == 0,
            ),
        ],
      ),
    );
  }

  Widget _buildSkillsTab(_Palette palette) {
    return Column(
      children: [
        _SectionCard(
          palette: palette,
          title: 'Soft Skills',
          icon: Icons.psychology,
          child: Column(
            children: [
              for (final skill in _softSkills)
                _SkillBar(palette: palette, skill: skill),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          palette: palette,
          title: 'Special Talents',
          icon: Icons.star,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final talent in _talents)
                SizedBox(
                  width: 130,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: palette.chip,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(talent.icon, color: palette.accent2, size: 36),
                        const SizedBox(height: 8),
                        Text(
                          talent.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: palette.text,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}



class _Qualification {
  const _Qualification({
    required this.title,
    required this.institution,
    required this.period,
    required this.result,
  });

  final String title;
  final String institution;
  final String period;
  final String result;
}

class _Skill {
  const _Skill(this.label, this.icon, this.level);

  final String label;
  final IconData icon;
  final double level;
}

class _Talent {
  const _Talent(this.icon, this.label);

  final IconData icon;
  final String label;
}



class _Palette {
  const _Palette({
    required this.background,
    required this.backgroundEnd,
    required this.heroGradient,
    required this.card,
    required this.chip,
    required this.text,
    required this.subText,
    required this.accent,
    required this.accent2,
  });

  final Color background;
  final Color backgroundEnd;
  final List<Color> heroGradient;
  final Color card;
  final Color chip;
  final Color text;
  final Color subText;
  final Color accent;
  final Color accent2;

  static const light = _Palette(
    background: Color(0xFFE9E1FF),
    backgroundEnd: Color(0xFFFFE4F1),
    heroGradient: [Color(0xFF4C1D95), Color(0xFF7C3AED), Color(0xFFDB2777)],
    card: Color(0xF2FFFFFF),
    chip: Color(0xFFEDE9FE),
    text: Color(0xFF1F1147),
    subText: Color(0xFF6B6B80),
    accent: Color(0xFF7C3AED),
    accent2: Color(0xFFEC4899),
  );

  static const dark = _Palette(
    background: Color(0xFF0F0B1E),
    backgroundEnd: Color(0xFF1E1038),
    heroGradient: [Color(0xFF1E1B4B), Color(0xFF4C1D95), Color(0xFF9D174D)],
    card: Color(0xFF1B1535),
    chip: Color(0xFF2A2150),
    text: Color(0xFFF3F0FF),
    subText: Color(0xFFA8A3C0),
    accent: Color(0xFFA78BFA),
    accent2: Color(0xFFF472B6),
  );
}

// -----------------------------------------------------------------------------
// Hero decoration
// -----------------------------------------------------------------------------

/// Paints soft translucent circles and rings over the hero gradient.
class _HeroPatternPainter extends CustomPainter {
  const _HeroPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = Colors.white.withValues(alpha: 0.08);
    final ring = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas
      ..drawCircle(Offset(size.width * 0.15, size.height * 0.2), 90, fill)
      ..drawCircle(Offset(size.width * 0.9, size.height * 0.15), 130, fill)
      ..drawCircle(Offset(size.width * 0.8, size.height * 0.75), 70, fill)
      ..drawCircle(Offset(size.width * 0.1, size.height * 0.8), 50, fill)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.45), 150, ring)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.45), 210, ring);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.palette,
    required this.title,
    required this.icon,
    required this.child,
  });

  final _Palette palette;
  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: palette.accent),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: palette.text,
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

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.palette,
    required this.value,
    required this.label,
  });

  final _Palette palette;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: palette.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: palette.accent,
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 12, color: palette.subText)),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.palette,
    required this.icon,
    required this.label,
    required this.value,
    this.trailing,
  });

  final _Palette palette;
  final IconData icon;
  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: palette.chip,
          child: Icon(icon, color: palette.accent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: palette.subText),
              ),
              Text(
                value,
                style: TextStyle(
                  color: palette.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.palette,
    required this.qualification,
    required this.isLast,
    required this.initiallyExpanded,
  });

  final _Palette palette;
  final _Qualification qualification;
  final bool isLast;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [palette.accent, palette.accent2],
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: palette.accent.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: palette.chip,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: initiallyExpanded,
                    iconColor: palette.accent,
                    collapsedIconColor: palette.subText,
                    title: Text(
                      qualification.title,
                      style: TextStyle(
                        color: palette.text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      qualification.period,
                      style: TextStyle(color: palette.accent),
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        qualification.institution,
                        style: TextStyle(color: palette.text),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        qualification.result,
                        style: TextStyle(color: palette.subText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  const _SkillBar({required this.palette, required this.skill});

  final _Palette palette;
  final _Skill skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(skill.icon, size: 18, color: palette.accent),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  skill.label,
                  style: TextStyle(
                    color: palette.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${(skill.level * 100).round()}%',
                style: TextStyle(color: palette.subText),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: skill.level),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: palette.chip,
                valueColor: AlwaysStoppedAnimation<Color>(palette.accent2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
