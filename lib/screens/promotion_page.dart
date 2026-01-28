import 'package:figma/npl_theme.dart';
import 'package:flutter/material.dart';
import 'package:figma/widgets/nav_bar.dart';
import 'package:figma/widgets/footer.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            _PromotionHeroSection(),
            _NPLIntroSection(),
            _CoursesSection(),
            _GreenBannerSection(),
            _EducationSection(),
            _BlogSection(),
            _BottomCTASection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// Hero Section
class _PromotionHeroSection extends StatelessWidget {
  const _PromotionHeroSection();

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
                "https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&q=80&w=1200",
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
                    "NPL 전문가로의 첫걸음",
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
                    "체계적인 교육 프로그램으로 NPL 투자 전문가가 되어보세요",
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

// NPL Intro Section
class _NPLIntroSection extends StatelessWidget {
  const _NPLIntroSection();

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
                "NPL은 무엇인 적은",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸 빈칸 빈칸 빈칸 빈칸빈칸빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "온라인 수강반 세부정보 빈칸 교육",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              SizedBox(height: isMobile ? 20 : 30),
              GridView.count(
                crossAxisCount: isMobile ? 2 : 4,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.1 : 1.2,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _CourseIntroCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 수빈칸빈칸",
                  ),
                  _CourseIntroCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸 빈칸빈칸",
                  ),
                  _CourseIntroCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸",
                  ),
                  _CourseIntroCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292089-90a7e086ee0c?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸빈칸 빈칸",
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

class _CourseIntroCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const _CourseIntroCard({required this.imageUrl, required this.title});

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
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Courses Section
class _CoursesSection extends StatelessWidget {
  const _CoursesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      //   child: const _GreenBannerSection(),
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

// Education Section
class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "수빈칸빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸",
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
              // Education Grid
              GridView.count(
                crossAxisCount: isMobile ? 2 : (isTablet ? 3 : 4),
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸빈칸 수빈칸빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸 빈칸 빈칸빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸빈칸 빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292089-90a7e086ee0c?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸빈칸 빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸빈칸빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1531482615713-2afd69097998?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸 빈칸빈칸 빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸 빈칸빈칸빈칸",
                  ),
                  _EducationCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292089-90a7e086ee0c?auto=format&fit=crop&q=80&w=400",
                    category: "빈칸빈칸",
                    title: "빈칸빈칸 빈칸빈칸빈칸",
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

class _EducationCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;

  const _EducationCard({
    required this.imageUrl,
    required this.category,
    required this.title,
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
      ],
    );
  }
}

// Blog Section
class _BlogSection extends StatelessWidget {
  const _BlogSection();

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
                "지빈칸-빈칸",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸빈칸빈칸",
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
                    _FilterChip("빈칸빈칸", false),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Blog Grid
              Column(
                children: const [
                  _BlogCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸",
                    description:
                        "  빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                    date: "2025 4.5",
                  ),
                  SizedBox(height: 20),
                  _BlogCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?auto=format&fit=crop&q=80&w=400",
                    title: "빈칸 빈칸 ",
                    description:
                        "  빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                    date: "2025 4.5 ",
                  ),
                  SizedBox(height: 20),
                  _BlogCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&q=80&w=400",
                    title: "    빈칸",
                    description:
                        "  빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                    date: "2025 4.5 ",
                  ),
                  SizedBox(height: 20),
                  _BlogCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&q=80&w=400",
                    title: "  ",
                    description:
                        "  빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸 빈칸",
                    date: "2025 4.5 ",
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

class _BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  const _BlogCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
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
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkText,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
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
                          const SizedBox(height: 12),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkText,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
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
              colors: [const Color(0xFF4A90E2), const Color(0xFF357ABD)],
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
              if (!isMobile) Text("📦", style: TextStyle(fontSize: 80)),
            ],
          ),
        );
      },
    );
  }
}
