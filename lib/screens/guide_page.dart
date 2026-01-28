import 'package:npl_app/npl_theme.dart';
import 'package:flutter/material.dart';
import 'package:npl_app/widgets/nav_bar.dart';
import 'package:npl_app/widgets/footer.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            _GuideHeroSection(),
            _WhyChooseSection(),
            _PropertyListSection(),
            _PartnerBrandsSection(),
            _GuideFAQSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// Hero Section
class _GuideHeroSection extends StatelessWidget {
  const _GuideHeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          height: isMobile ? 300 : 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=1200",
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
                    "ONLY 풀하우스",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 32 : 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "여기서만 제공되는 특별한 파트너십과 혜택을 만나보세요",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
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

// Why Choose Section
class _WhyChooseSection extends StatelessWidget {
  const _WhyChooseSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            children: [
              Text(
                "빈칸 중인 사람·사업에 어떠한 이점이 있습니까?",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "본 플랫폼을 사용할 수 있는 이유 · 빈칸 · 빈칸 등에서 · 빈칸 목적이 · 빈칸 목적",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 30 : 60),
              isMobile
                  ? Column(
                      children: const [
                        _BenefitCard(
                          icon: "📋",
                          title: "간편 절차",
                          description: "빠른 등록과 간편한 절차",
                        ),
                        SizedBox(height: 20),
                        _BenefitCard(
                          icon: "📊",
                          title: "빠른 구매 성공",
                          description: "빠른 거래와 높은 성공률",
                        ),
                        SizedBox(height: 20),
                        _BenefitCard(
                          icon: "📁",
                          title: "전문적인 상담 지원",
                          description: "전문가의 1:1 맞춤 상담",
                        ),
                        SizedBox(height: 20),
                        _BenefitCard(
                          icon: "🔒",
                          title: "정보보안 관리 지원",
                          description: "안전한 거래와 정보 보호",
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: const [
                        _BenefitCard(
                          icon: "📋",
                          title: "간편 절차",
                          description: "빠른 등록과 간편한 절차",
                        ),
                        _BenefitCard(
                          icon: "📊",
                          title: "빠른 구매 성공",
                          description: "빠른 거래와 높은 성공률",
                        ),
                        _BenefitCard(
                          icon: "📁",
                          title: "전문적인 상담 지원",
                          description: "전문가의 1:1 맞춤 상담",
                        ),
                        _BenefitCard(
                          icon: "🔒",
                          title: "정보보안 관리 지원",
                          description: "안전한 거래와 정보 보호",
                        ),
                      ],
                    ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 30,
                    vertical: isMobile ? 12 : 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "풀하우스 가이드 보기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
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

class _BenefitCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return SizedBox(
          width: isMobile ? double.infinity : 200,
          child: Column(
            children: [
              Container(
                width: isMobile ? 60 : 80,
                height: isMobile ? 60 : 80,
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    icon,
                    style: TextStyle(fontSize: isMobile ? 30 : 40),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
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

// Property List Section
class _PropertyListSection extends StatelessWidget {
  const _PropertyListSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 20 : 100,
          ),
          color: const Color(0xFFF9F9F9),
          child: Column(
            children: [
              Text(
                "현재 판매 중인 세부 사항 노출",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "현재 판매 중인 빈칸 중인 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 노출",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _FilterTab("빈칸 빈칸 빈칸", true),
                    _FilterTab("아파트", false),
                    _FilterTab("주택", false),
                    _FilterTab("빌딩", false),
                    _FilterTab("상가", false),
                    _FilterTab("토지", false),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Property Grid
              GridView.count(
                crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 4),
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.2 : 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600596542815-2a4d04774c13?auto=format&fit=crop&q=80&w=400",
                    title: "서울 오피스 빌딩",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&q=80&w=400",
                    title: "서울 빌딩 빌딩",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸 빈칸",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&q=80&w=400",
                    title: "서울 빈칸빈칸빈칸",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1554469384-e58fac16e23a?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸 빈칸",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=400",
                    title: "서울 빈칸 빌딩",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸 빈칸빈칸",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
                  ),
                  _PropertyCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80&w=400",
                    title: "서울 빈칸",
                    subtitle: "빈칸 · 빈칸 빈칸 빈칸",
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

class _FilterTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const _FilterTab(this.text, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
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

class _PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const _PropertyCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 5),
        Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      ],
    );
  }
}

// Partner Brands Section
class _PartnerBrandsSection extends StatelessWidget {
  const _PartnerBrandsSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            children: [
              Text(
                "우리와 함께하는 업체",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 30 : 60),
              isMobile
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _BrandLogo("Klarna.", Colors.pink[100]!, isMobile),
                            _BrandLogo("💳", Colors.orange[50]!, isMobile),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _BrandLogo("Skrill", Colors.purple[50]!, isMobile),
                            _BrandLogo("VISA", Colors.blue[900]!, isMobile),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _BrandLogo("⏰", Colors.red[50]!, isMobile),
                      ],
                    )
                  : Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _BrandLogo("Klarna.", Colors.pink[100]!, isMobile),
                        _BrandLogo("💳", Colors.orange[50]!, isMobile),
                        _BrandLogo("Skrill", Colors.purple[50]!, isMobile),
                        _BrandLogo("VISA", Colors.blue[900]!, isMobile),
                        _BrandLogo("⏰", Colors.red[50]!, isMobile),
                      ],
                    ),
              SizedBox(height: isMobile ? 20 : 40),
              isMobile
                  ? Column(
                      children: const [
                        _BrandDescription("빈칸 빈칸", "빈칸 빈칸"),
                        SizedBox(height: 15),
                        _BrandDescription("빈칸빈칸 빈칸빈칸", "빈칸 빈칸"),
                        SizedBox(height: 15),
                        _BrandDescription("스크릴 빈칸빈칸", "빈칸 빈칸"),
                        SizedBox(height: 15),
                        _BrandDescription("비자", "빈칸 빈칸"),
                        SizedBox(height: 15),
                        _BrandDescription("빈칸 빈칸빈칸 빈칸 빈칸", "빈칸 빈칸"),
                      ],
                    )
                  : Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: const [
                        _BrandDescription("빈칸 빈칸", "빈칸 빈칸"),
                        _BrandDescription("빈칸빈칸 빈칸빈칸", "빈칸 빈칸"),
                        _BrandDescription("스크릴 빈칸빈칸", "빈칸 빈칸"),
                        _BrandDescription("비자", "빈칸 빈칸"),
                        _BrandDescription("빈칸 빈칸빈칸 빈칸 빈칸", "빈칸 빈칸"),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _BrandLogo extends StatelessWidget {
  final String text;
  final Color bgColor;
  final bool isMobile;

  const _BrandLogo(this.text, this.bgColor, this.isMobile);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 140 : 140,
      height: isMobile ? 80 : 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: text.contains("💳") || text.contains("⏰")
                ? (isMobile ? 30 : 40)
                : (isMobile ? 18 : 24),
            fontWeight: FontWeight.w900,
            color: bgColor == Colors.blue[900] ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _BrandDescription extends StatelessWidget {
  final String title;
  final String subtitle;

  const _BrandDescription(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// FAQ Section
class _GuideFAQSection extends StatelessWidget {
  const _GuideFAQSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 20 : 100,
          ),
          color: const Color(0xFFF9F9F9),
          child: Column(
            children: [
              Text(
                "자주 묻는 질문",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _FAQFilterTab("전체", true),
                    _FAQFilterTab("빈칸빈칸", false),
                    _FAQFilterTab("사용 방법", false),
                    _FAQFilterTab("빌딩", false),
                    _FAQFilterTab("빈칸빈칸", false),
                    _FAQFilterTab("빈칸빈칸빈칸 빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const _FAQItem("빈전체(NPL)칸 빌딩?"),
              const Divider(),
              const _FAQItem("자주 묻는 질문?"),
              const Divider(),
              const _FAQItem("놓치지 마세요 (NPL) 패키지특별 혜택 놓치지?"),
              const Divider(),
              const _FAQItem("비자풀하우스 놓치지 마세요?"),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class _FAQFilterTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const _FAQFilterTab(this.text, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;

  const _FAQItem(this.question);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.darkText,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 24),
        ],
      ),
    );
  }
}
