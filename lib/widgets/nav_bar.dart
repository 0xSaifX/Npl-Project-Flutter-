import 'package:flutter/material.dart';
import 'package:npl_app/screens/guide_page.dart';
import 'package:npl_app/screens/project_page.dart';
import 'package:npl_app/screens/promotion_page.dart';
import 'package:npl_app/screens/community_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 30,
            vertical: isMobile ? 12 : 20,
          ),
          color: Colors.white,
          child: isMobile ? _buildMobileNav() : _buildDesktopNav(),
        );
      },
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "FULLHOUSE",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Row(
          children: [
            _NavButton(
              "가이드",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GuidePage()),
              ),
            ),
            _NavButton(
              "프로젝트",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectPage()),
              ),
            ),
            _NavButton(
              "프로모션",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PromotionPage()),
              ),
            ),
            _NavButton(
              "커뮤니티",
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommunityPage()),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _SearchButton(),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: IconButton(
                icon: const Icon(Icons.person_outline, size: 20),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('프로필 페이지로 이동합니다.')),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('로그인 화면으로 이동합니다.')),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "로그인",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "FULLHOUSE",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Row(
          children: [
            _SearchButton(),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _showMobileMenu();
              },
            ),
          ],
        ),
      ],
    );
  }

  void _showMobileMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileMenuButton("가이드", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GuidePage()),
                  );
                }),
                _MobileMenuButton("프로젝트", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectPage(),
                    ),
                  );
                }),
                _MobileMenuButton("프로모션", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PromotionPage(),
                    ),
                  );
                }),
                _MobileMenuButton("커뮤니티", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunityPage(),
                    ),
                  );
                }),
                const Divider(),
                _MobileMenuButton("프로필", () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('프로필 페이지로 이동합니다.')),
                  );
                }),
                _MobileMenuButton("로그인", () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('로그인 화면으로 이동합니다.')),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileMenuButton(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: onTap,
    );
  }
}

class _SearchButton extends StatefulWidget {
  const _SearchButton();

  @override
  State<_SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<_SearchButton> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        icon: const Icon(Icons.search, size: 20),
        onPressed: () {
          _showSearchDialog();
        },
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('검색'),
          content: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_searchController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('검색어: ${_searchController.text}')),
                  );
                  Navigator.pop(context);
                  _searchController.clear();
                }
              },
              child: const Text('검색'),
            ),
          ],
        );
      },
    );
  }
}

// Simple Placeholder Page for navigation demo
class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("$title 페이지입니다.", style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
