import 'dart:async';
import 'package:figma/npl_theme.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _sliderData = [
    {
      "tag": "이벤트",
      "title": "프리미엄\n할인 쿠폰\n즉시 지급",
      "color": const Color(0xFFFFAB91),
      "icon": "%",
    },
    {
      "tag": "특별 혜택",
      "title": "신규 가입\n웰컴 패키지\n무료 증정",
      "color": const Color(0xFF80CBC4),
      "icon": "🎁",
    },
    {
      "tag": "놓치지 마세요",
      "title": "한정판\n멤버십 카드\n선착순",
      "color": const Color(0xFFF48FB1),
      "icon": "💳",
    },
    {
      "tag": "뉴스",
      "title": "풀하우스\n2023 비전\n발표",
      "color": const Color(0xFFCE93D8),
      "icon": "📢",
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _sliderData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isSmallMobile = width < 375;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 900;
        final isDesktop = width >= 900;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallMobile
                ? 12
                : (isMobile ? 20 : (isTablet ? 40 : 100)),
            vertical: isSmallMobile
                ? 20
                : (isMobile ? 30 : (isTablet ? 40 : 60)),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: isSmallMobile ? 400 : (isMobile ? 500 : 600),
            ),
            child: Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: 1, // Always give space to content
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _sliderData.length,
                    itemBuilder: (context, index) {
                      final data = _sliderData[index];
                      return _HeroContent(
                        isSmallMobile: isSmallMobile,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        isDesktop: isDesktop,
                        data: data,
                        currentPage: _currentPage,
                        totalPage: _sliderData.length,
                      );
                    },
                  ),
                ),
                if (isDesktop) ...[
                  HeroImage(
                    isSmallMobile: isSmallMobile,
                    isMobile: isMobile,
                    isTablet: isTablet,
                    isDesktop: isDesktop,
                    data: _sliderData[_currentPage],
                  ),
                ] else ...[
                  const SizedBox(height: 20),
                  HeroImage(
                    isSmallMobile: isSmallMobile,
                    isMobile: isMobile,
                    isTablet: isTablet,
                    isDesktop: isDesktop,
                    data: _sliderData[_currentPage],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isSmallMobile;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final Map<String, dynamic> data;
  final int currentPage;
  final int totalPage;

  const _HeroContent({
    required this.isSmallMobile,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.data,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: isSmallMobile ? 5 : 10,
          runSpacing: 8,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallMobile ? 8 : 12,
                vertical: isSmallMobile ? 4 : 6,
              ),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                data["tag"],
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallMobile ? 10 : 12,
                ),
              ),
            ),
            Text(
              "오직 풀하우스에서만!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isSmallMobile ? 11 : 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          data["title"],
          style: TextStyle(
            fontSize: isSmallMobile
                ? 28
                : (isMobile ? 40 : (isTablet ? 48 : 56)),
            fontWeight: FontWeight.w900,
            color: AppColors.darkText,
            height: 1.2,
            fontFamily: 'NotoSans',
          ),
        ),
        const SizedBox(height: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              totalPage,
              (index) => _IndicatorDot(isActive: index == currentPage),
            ),
          ),
        ),
        if (isMobile) const SizedBox(height: 30),
      ],
    );
  }
}

class HeroImage extends StatelessWidget {
  final bool isSmallMobile;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final Map<String, dynamic> data;

  const HeroImage({
    super.key,
    required this.isSmallMobile,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final containerHeight = isSmallMobile
        ? 250
        : (isMobile ? 300 : (isTablet ? 350 : 400));
    final containerWidth = isDesktop ? 500.0 : double.infinity;
    final imageSize = isSmallMobile
        ? 120
        : (isMobile ? 160 : (isTablet ? 180 : 200));
    final imageFontSize = isSmallMobile
        ? 40
        : (isMobile ? 60 : (isTablet ? 70 : 80));

    return Container(
      width: containerWidth,
      height: containerHeight.toDouble(),
      decoration: BoxDecoration(
        color: AppColors.heroBlue,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: isSmallMobile ? 30 : 50,
            right: isSmallMobile ? 30 : 50,
            child: Icon(
              Icons.circle,
              size: isSmallMobile ? 25 : 40,
              color: Colors.yellow[700],
            ),
          ),
          Positioned(
            bottom: isSmallMobile ? 60 : 80,
            left: isSmallMobile ? 40 : 60,
            child: Icon(
              Icons.circle,
              size: isSmallMobile ? 30 : 50,
              color: Colors.yellow[800],
            ),
          ),
          Transform.rotate(
            angle: -0.2,
            child: AnimatedContainer(
              // Animated container for smooth color transition
              duration: const Duration(milliseconds: 500),
              width: imageSize.toDouble(),
              height: imageSize.toDouble(),
              decoration: BoxDecoration(
                color: data["color"],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  data["icon"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: imageFontSize.toDouble(),
                    fontWeight: FontWeight.bold,
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

class _IndicatorDot extends StatelessWidget {
  final bool isActive;
  const _IndicatorDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Animated indicator
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      width: isActive ? 30 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
