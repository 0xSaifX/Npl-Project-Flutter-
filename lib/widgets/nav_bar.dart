import 'package:flutter/material.dart';
import 'package:figma/screens/guide_page.dart';
import 'package:figma/screens/project_page.dart';
import 'package:figma/screens/promotion_page.dart';
import 'package:figma/screens/community_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          InkWell(
            onTap: () {
              // Navigate to Home
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
          const SizedBox(width: 40),
          Row(
            children: [
              _NavButton("가이드", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GuidePage()))),
              _NavButton("프로젝트", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectPage()))),
              _NavButton("프로모션", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PromotionPage()))),
              _NavButton("커뮤니티", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CommunityPage()))),
              const SizedBox(width: 40),
               Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, size: 20),
                  onPressed: () {
                     // Search Action
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('검색 기능은 준비중입니다.')));
                  },
                ),
               ),
               const SizedBox(width: 15),
               Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: IconButton(
                  icon: const Icon(Icons.person_outline, size: 20),
                  onPressed: () {
                    // Profile Action
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('프로필 페이지로 이동합니다.')));
                  },
                ),
               ),
               const SizedBox(width: 15),
               InkWell(
                 onTap: () {
                    // Sign In Action
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('로그인 화면으로 이동합니다.')));
                 },
                 child: Container(
                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: const Text("로그인", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                 ),
               )
            ],
          ),
          ],
        ),
      ),
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

// Simple Placeholder Page for navigation demo
class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("$title 페이지입니다.", style: const TextStyle(fontSize: 20))),
    );
  }
}
