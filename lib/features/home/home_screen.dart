import 'package:flutter/material.dart';
import '../../core/models/member_model.dart';
import '../../core/state/favorites_manager.dart';
import '../../core/widgets/member_photo.dart';

import '../members/dilki/dilki_bio_screen.dart' as dilki;
import '../members/dismini/dismini_bio_screen.dart' as dismini;
import '../members/imal/imal_bio_screen.dart' as imal;
import '../members/mahroos/mahroos_bio_screen.dart' as mahroos;
import '../members/naduni/naduni_bio_screen.dart' as naduni;
// import '../members/nimthaka/nimthaka_bio_screen.dart' as nimthaka;
import '../members/pamodya/pamodya_bio_screen.dart' as pamodya;
import '../members/rukshan/rukshan_bio_screen.dart' as rukshan;

// import '../members/sandaru/sandaru_bio_screen.dart' as sandaru;

class HomeScreen extends StatefulWidget {
  final VoidCallback? onLogout;

  const HomeScreen({super.key, this.onLogout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FavoritesManager _favManager = FavoritesManager();

  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _isGridView = true;

  static const Color brandNavy = Color(0xFF0F172A);
  static const Color brandIndigo = Color(0xFF4F46E5);
  static const Color bgSurface = Color(0xFFF8FAFC);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.logout_rounded, color: Color(0xFFEF4444)),
            SizedBox(width: 10),
            Text(
              'Confirm Sign Out',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to log out of Nexora? You will be returned to the Firebase login screen.',
          style: TextStyle(fontSize: 14, color: Color(0xFF475569)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF64748B)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              if (widget.onLogout != null) {
                widget.onLogout!();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  Widget _routeToMemberBio(int memberId) {
    switch (memberId) {
      case 1:
        return const mahroos.MahroosBioScreen();
      case 2:
        return const dilki.DilkiBioScreen();
      case 3:
        return const dismini.DisminiBioScreen();
      case 4:
        return const imal.ImalBioScreen();
      case 5:
        return const naduni.NaduniBioScreen();
      case 6:
      //   return const nimthaka.NimthakaBioScreen();
      case 7:
        return const pamodya.PamodyaBioScreen();
      case 8:
        return const rukshan.RukshanBioScreen();
      case 9:
      // return const sandaru.SandaruBioScreen();
      default:
        return const mahroos.MahroosBioScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final allMembers = NexoraMembers.list;

    // Filter members based on search and category
    final filteredMembers = allMembers.where((m) {
      final matchesSearch =
          m.fullName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          m.role.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          m.technicalSkills.any(
            (s) => s.toLowerCase().contains(_searchQuery.toLowerCase()),
          );

      if (!matchesSearch) return false;

      if (_selectedCategory == 'Favorites') {
        return _favManager.isFavorite(m.id);
      } else if (_selectedCategory == 'Tech & Systems') {
        return m.id == 1 || m.id == 4 || m.id == 6 || m.id == 7 || m.id == 9;
      } else if (_selectedCategory == 'Design & QA') {
        return m.id == 2 || m.id == 3 || m.id == 5 || m.id == 8;
      }
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: bgSurface,
      appBar: AppBar(
        backgroundColor: brandNavy,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: brandIndigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.hub_rounded,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'NEXORA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          // Toggle View Mode
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
            ),
            tooltip: _isGridView
                ? 'Switch to List View'
                : 'Switch to Grid View',
            onPressed: () {
              setState(() => _isGridView = !_isGridView);
            },
          ),
          // Logout Option (MANDATORY REQUIREMENT)
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Sign Out',
            onPressed: _confirmLogout,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _favManager,
          builder: (context, _) {
            return CustomScrollView(
              slivers: [
                // Top Header Banner
                SliverToBoxAdapter(
                  child: Container(
                    color: brandNavy,
                    padding: const EdgeInsets.fromLTRB(22, 10, 22, 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Community Directory',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Nine distinct profiles. One unified team.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Search Bar
                        TextField(
                          controller: _searchController,
                          onChanged: (val) =>
                              setState(() => _searchQuery = val),
                          style: const TextStyle(
                            color: brandNavy,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search by member name, role or skill...',
                            hintStyle: const TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: brandIndigo,
                              size: 20,
                            ),
                            suffixIcon: _searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.close, size: 18),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() => _searchQuery = '');
                                    },
                                  )
                                : null,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Category Filter Chips
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
                    child: Row(
                      children: [
                        _buildFilterChip('All', 'All (${allMembers.length})'),
                        _buildFilterChip(
                          'Tech & Systems',
                          'Tech & Systems (5)',
                        ),
                        _buildFilterChip('Design & QA', 'Design & QA (4)'),
                        _buildFilterChip(
                          'Favorites',
                          'Favorited (${allMembers.where((m) => _favManager.isFavorite(m.id)).length})',
                        ),
                      ],
                    ),
                  ),
                ),

                // Section Title Row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Showing ${filteredMembers.length} Members',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF475569),
                          ),
                        ),
                        Text(
                          _isGridView ? 'Grid View' : 'List View',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Members List / Grid
                if (filteredMembers.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 54,
                            color: Color(0xFFCBD5E1),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No team members found matching your search.',
                            style: TextStyle(color: Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (_isGridView)
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 6, 18, 30),
                    sliver: SliverLayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = constraints.crossAxisExtent > 750
                            ? 3
                            : constraints.crossAxisExtent > 500
                            ? 2
                            : 1;

                        return SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: crossAxisCount == 1
                                    ? 1.6
                                    : 0.88,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final member = filteredMembers[index];
                            return _buildGridCard(member);
                          }, childCount: filteredMembers.length),
                        );
                      },
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 6, 18, 30),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final member = filteredMembers[index];
                        return _buildListTileCard(member);
                      }, childCount: filteredMembers.length),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterChip(String key, String label) {
    final isSelected = _selectedCategory == key;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        selected: isSelected,
        label: Text(label),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF334155),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 12,
        ),
        backgroundColor: Colors.white,
        selectedColor: brandIndigo,
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? brandIndigo : const Color(0xFFE2E8F0),
          ),
        ),
        onSelected: (val) {
          setState(() => _selectedCategory = key);
        },
      ),
    );
  }

  Widget _buildGridCard(MemberData member) {
    final isFav = _favManager.isFavorite(member.id);

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => _routeToMemberBio(member.id)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Top Row with Member Badge and Favorite Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '#${member.id}',
                    style: const TextStyle(
                      color: brandIndigo,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFav
                        ? const Color(0xFFEF4444)
                        : const Color(0xFF94A3B8),
                  ),
                  onPressed: () => _favManager.toggleFavorite(member.id),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Portrait Avatar
            MemberPhoto(
              name: member.fullName,
              imagePath: member.avatarUrl,
              size: 80,
              borderWidth: 2,
              borderColor: brandIndigo.withValues(alpha: 0.2),
            ),

            const SizedBox(height: 12),

            // Full Name
            Text(
              member.fullName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: brandNavy,
              ),
            ),

            const SizedBox(height: 3),

            // Role
            Text(
              member.role,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),

            // View Bio pill
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Explore Bio',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: brandIndigo,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: brandIndigo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileCard(MemberData member) {
    final isFav = _favManager.isFavorite(member.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => _routeToMemberBio(member.id)),
          );
        },
        leading: MemberPhoto(
          name: member.fullName,
          imagePath: member.avatarUrl,
          size: 54,
          borderWidth: 2,
          borderColor: brandIndigo.withValues(alpha: 0.2),
        ),
        title: Text(
          member.fullName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: brandNavy,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              member.role,
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.place_outlined,
                  size: 12,
                  color: Color(0xFF94A3B8),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    member.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav
                    ? const Color(0xFFEF4444)
                    : const Color(0xFFCBD5E1),
                size: 20,
              ),
              onPressed: () => _favManager.toggleFavorite(member.id),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
