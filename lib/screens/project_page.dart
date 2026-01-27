import 'package:figma/npl_theme.dart';
import 'package:flutter/material.dart';
import 'package:figma/widgets/nav_bar.dart';
import 'package:figma/widgets/footer.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            _ProjectHeroSection(),
            _ProjectTabSection(),
            _OnlyBrandsSection(),
            _GreenBannerSection(),
            _InteriorSection(),
            _MaterialsSection(),
            _BottomCTASection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// Hero Section
class _ProjectHeroSection extends StatelessWidget {
  const _ProjectHeroSection();

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
                "https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?auto=format&fit=crop&q=80&w=1200",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.3),
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
                    "새로운 공간, 새로운 스타일",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "풀하우스와 함께 당신만의 공간을 완성하세요",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: isMobile ? 13 : 16,
                      fontWeight: FontWeight.w400,
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

// Tab Section
class _ProjectTabSection extends StatelessWidget {
  const _ProjectTabSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 20 : 30,
            horizontal: isMobile ? 20 : 100,
          ),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _TabButton("인테리어", true),
                _TabButton("자재 정보", false),
                _TabButton("시공사례", false),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool isActive;

  const _TabButton(this.text, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isActive ? Colors.black : Colors.grey[300]!,
            width: isActive ? 3 : 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.grey[600],
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}

// ONLY Brands Section
class _OnlyBrandsSection extends StatelessWidget {
  const _OnlyBrandsSection();

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
            children: [
              Text(
                "ONLY 풀하우스",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "풀하우스만의 특별한 파트너십과 혜택을 누리세요",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 30 : 50),
              isMobile
                  ? Column(
                      children: const [
                        _BrandCard("Klarna.", Colors.pink, "유연한 결제", "간편하고 빠른 결제"),
                        SizedBox(height: 20),
                        _BrandCard("💳", Colors.orange, "마스터카드 특별혜택", "빠르고 안전한 거래"),
                        SizedBox(height: 20),
                        _BrandCard("Skrill", Colors.purple, "스크릴 디지털월렛", "빠르고 안전한 거래"),
                        SizedBox(height: 20),
                        _BrandCard("amazon", Colors.orange, "아마존 쇼핑리워드", "다양한 혜택 제공"),
                        SizedBox(height: 20),
                        _BrandCard("amazon", Colors.orange, "아마존 쇼핑리워드", "다양한 혜택 제공"),
                      ],
                    )
                  : Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: const [
                        _BrandCard("Klarna.", Colors.pink, "유연한 결제", "간편하고 빠른 결제"),
                        _BrandCard("💳", Colors.orange, "마스터카드 특별혜택", "빠르고 안전한 거래"),
                        _BrandCard("Skrill", Colors.purple, "스크릴 디지털월렛", "빠르고 안전한 거래"),
                        _BrandCard("amazon", Colors.orange, "아마존 쇼핑리워드", "다양한 혜택 제공"),
                        _BrandCard("amazon", Colors.orange, "아마존 쇼핑리워드", "다양한 혜택 제공"),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _BrandCard extends StatelessWidget {
  final String logo;
  final Color color;
  final String title;
  final String subtitle;

  const _BrandCard(this.logo, this.color, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Container(
          width: isMobile ? double.infinity : 180,
          child: Column(
            children: [
              Container(
                width: isMobile ? 120 : 140,
                height: isMobile ? 80 : 100,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    logo,
                    style: TextStyle(
                      fontSize: logo.contains("💳") ? (isMobile ? 30 : 40) : (isMobile ? 18 : 22),
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 13 : 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

// Green Banner Section
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
              colors: [
                const Color(0xFFD4F1C5),
                const Color(0xFFB8E99F),
              ],
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
                      "빈칸 빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.green[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: isMobile ? 8 : 10),
                    Text(
                      "경쟁력 있기는 한가 비싸지 않게 빠르게 구매하세요!",
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    SizedBox(height: isMobile ? 5 : 8),
                    Text(
                      "빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Text(
                  "🌿",
                  style: TextStyle(fontSize: 80),
                ),
            ],
          ),
        );
      },
    );
  }
}

// Interior Section
class _InteriorSection extends StatelessWidget {
  const _InteriorSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "인테리어",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              // Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _FilterChip("빈칸빈칸 빈칸빈칸", true),
                    _FilterChip("빈칸", false),
                    _FilterChip("주방", false),
                    _FilterChip("빈칸", false),
                    _FilterChip("거실", false),
                    _FilterChip("빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Interior Grid
              GridView.count(
                crossAxisCount: isMobile ? 2 : (isTablet ? 3 : 4),
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸빈칸빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600607687644-c7171b42498f?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸 빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸빈칸빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600585154526-990dced4db0d?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸빈칸빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
                  ),
                  _InteriorCard(
                    imageUrl: "https://images.unsplash.com/photo-1600566752355-35792bedcfea?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸",
                    title: "빈칸 빈칸",
                    price: "빈칸빈칸 · 빈칸빈칸",
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
                        "빈칸빈칸 빈칸빈칸빈칸",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.arrow_forward, size: 16, color: Colors.grey[700]),
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
        border: Border.all(
          color: isActive ? Colors.black : Colors.grey[300]!,
        ),
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

class _InteriorCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String price;

  const _InteriorCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          category,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          price,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

// Materials Section
class _MaterialsSection extends StatelessWidget {
  const _MaterialsSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        
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
                "상품군",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              // Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _FilterChip("빈칸빈칸", true),
                    _FilterChip("빈칸빈칸빈칸 빈칸빈칸", false),
                    _FilterChip("빈칸빈칸 빈칸빈칸", false),
                    _FilterChip("빈칸빈칸빈칸 빈칸빈칸", false),
                    _FilterChip("빈칸빈칸빈칸빈칸 빈칸빈칸", false),
                    _FilterChip("빈칸 빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Materials Grid
              GridView.count(
                crossAxisCount: isMobile ? 2 : (isTablet ? 3 : 4),
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1615971677499-5467cbab01c0?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸 빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸빈칸 빈칸 빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸빈칸 빈칸 빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600566752355-35792bedcfea?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸빈칸 빈칸빈칸빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600585154526-990dced4db0d?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
                  ),
                  _MaterialCard(
                    imageUrl: "https://images.unsplash.com/photo-1600607687644-c7171b42498f?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸빈칸",
                    price: "빈칸 빈칸빈칸빈칸빈칸",
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

class _MaterialCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const _MaterialCard({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          price,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

// Bottom CTA Section
class _BottomCTASection extends StatelessWidget {
  const _BottomCTASection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 100,
            vertical: isMobile ? 30 : 50,
          ),
          padding: EdgeInsets.all(isMobile ? 40 : 60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF4A90E2),
                const Color(0xFF357ABD),
              ],
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
                      "빈칸빈칸빈칸빈칸 빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: isMobile ? 10 : 15),
                    Text(
                      "지금도 빈칸 빈칸, 빈칸 빈칸빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: isMobile ? 8 : 12),
                    Text(
                      "빈칸빈칸 빈칸빈칸 빈칸빈칸빈칸빈칸",
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Text(
                  "📦",
                  style: TextStyle(fontSize: 80),
                ),
            ],
          ),
        );
      },
    );
  }
}
