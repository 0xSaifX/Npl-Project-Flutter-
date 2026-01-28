import 'package:npl_app/npl_theme.dart';
import 'package:flutter/material.dart';
import 'package:npl_app/widgets/nav_bar.dart';
import 'package:npl_app/widgets/footer.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            _CommunityHeroSection(),
            _ServicesSection(),
            _GreenBannerSection(),
            _TeamSection(),
            _ReviewsSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class _CommunityHeroSection extends StatelessWidget {
  const _CommunityHeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          height: isMobile ? 250 : 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&q=80&w=1200",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.4),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "법률 문제, 전문가의 답변",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 40,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "빈칸 빈칸빈칸 빈칸빈칸 빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸빈칸 빈칸 빈칸빈칸 빈칸빈칸",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: isMobile ? 13 : 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "빈칸빈칸빈칸 서비스",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸 빈칸 빈칸빈칸빈칸빈칸빈칸빈칸빈칸빈칸빈칸 빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _FilterChip("빈칸빈칸", true),
                    _FilterChip("빈칸빈칸", false),
                    _FilterChip("빈칸빈칸", false),
                    _FilterChip("빈칸빈칸빈칸", false),
                    _FilterChip("빈칸빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GridView.count(
                crossAxisCount: isMobile ? 2 : 4,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.1,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _ServiceCard(
                    "https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸빈칸 빈칸빈칸빈칸빈칸",
                    "빈칸 빈칸",
                  ),
                  _ServiceCard(
                    "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸빈칸 빈칸 빈칸",
                    "빈칸 빈칸",
                  ),
                  _ServiceCard(
                    "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸빈칸 빈칸빈칸빈칸빈칸",
                    "빈칸 빈칸",
                  ),
                  _ServiceCard(
                    "https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=400",
                    "빈칸 빈칸빈칸빈칸",
                    "빈칸 빈칸",
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "빈칸 빈칸 빈칸",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final bool isActive;
  const _FilterChip(this.text, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: isActive ? Colors.black : Colors.grey[300]!),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const _ServiceCard(this.imageUrl, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GreenBannerSection extends StatelessWidget {
  const _GreenBannerSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 100,
            vertical: isMobile ? 20 : 30,
          ),
          padding: EdgeInsets.all(isMobile ? 30 : 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFD4F1C5), const Color(0xFFB8E99F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NPL 빈칸빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.green[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: isMobile ? 8 : 10),
                    Text(
                      "빈칸빈칸 빈칸빈칸 빈칸빈칸 빈칸빈칸빈칸 빈칸빈칸빈칸 빈칸빈칸빈칸!",
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    SizedBox(height: isMobile ? 5 : 8),
                    Text(
                      "빈칸빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) Text("🌿", style: TextStyle(fontSize: 80)),
            ],
          ),
        );
      },
    );
  }
}

class _TeamSection extends StatelessWidget {
  const _TeamSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "빈칸빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸빈칸 빈칸빈칸빈칸빈칸 빈칸 빈칸빈칸 빈칸 빈칸빈칸빈칸 빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "빈칸 빈칸빈칸빈칸빈칸빈칸 빈칸 빈칸빈칸 빈칸빈칸 빈칸빈칸",
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _FilterChip("빈칸빈칸", true),
                    _FilterChip("빈칸", false),
                    _FilterChip("빈칸 빈칸", false),
                    _FilterChip("빈칸빈칸빈칸", false),
                    _FilterChip("빈칸빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GridView.count(
                crossAxisCount: isMobile ? 2 : 4,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _TeamCard(
                    "https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸 빈칸 빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸 빈칸빈칸",
                    "빈칸 빈칸 빈칸빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸 빈칸빈칸빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸빈칸 빈칸 빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?auto=format&fit=crop&q=80&w=400",
                    "빈칸 빈칸빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                  _TeamCard(
                    "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=400",
                    "빈칸빈칸빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TeamCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  const _TeamCard(this.imageUrl, this.name, this.role);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 5),
        Text(role, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          color: const Color(0xFFF9F9F9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "최신 상담군",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸빈칸빈칸 빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _FilterChip("빈칸빈칸", true),
                    _FilterChip("빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: const [
                  _ReviewCard(
                    "빈칸빈칸",
                    "빈칸 빈칸 빈칸 빈칸빈칸빈칸빈칸 빈칸빈칸 빈칸빈칸 빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸빈칸빈칸빈칸 빈칸빈칸빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                  ),
                  SizedBox(height: 20),
                  _ReviewCard(
                    "빈칸빈칸",
                    "빈칸 빈칸 빈칸 빈칸빈칸빈칸 빈칸빈칸 빈칸 빈칸빈칸 빈칸빈칸 빈칸빈칸",
                    "빈칸빈칸 빈칸빈칸빈칸빈칸 빈칸빈칸빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "빈칸 빈칸",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  const _ReviewCard(this.category, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 11,
                color: Colors.orange[800],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
