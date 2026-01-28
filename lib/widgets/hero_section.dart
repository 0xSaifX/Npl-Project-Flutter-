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
        final isMobile = constraints.maxWidth < 900;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 100,
            vertical: isMobile ? 30 : 60,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 600),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
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
                        isMobile: isMobile,
                        data: data,
                        currentPage: _currentPage,
                        totalPage: _sliderData.length,
                      );
                    },
                  ),
                ),
                if (!isMobile) ...[
                  HeroImage(
                    isMobile: isMobile,
                    data: _sliderData[_currentPage],
                  ),
                ] else ...[
                  const SizedBox(height: 20),
                  HeroImage(
                    isMobile: isMobile,
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
  final bool isMobile;
  final Map<String, dynamic> data;
  final int currentPage;
  final int totalPage;

  const _HeroContent({
    required this.isMobile,
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
          spacing: 10,
          runSpacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                data["tag"],
                style: const TextStyle(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const Text(
              "오직 풀하우스에서만!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          data["title"],
          style: TextStyle(
            fontSize: isMobile ? 40 : 56,
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
  final bool isMobile;
  final Map<String, dynamic> data;

  const HeroImage({super.key, required this.isMobile, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 500,
      height: isMobile ? 300 : 400,
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
            top: 50,
            right: 50,
            child: Icon(Icons.circle, size: 40, color: Colors.yellow[700]),
          ),
          Positioned(
            bottom: 80,
            left: 60,
            child: Icon(Icons.circle, size: 50, color: Colors.yellow[800]),
          ),
          Transform.rotate(
            angle: -0.2,
            child: AnimatedContainer(
              // Animated container for smooth color transition
              duration: const Duration(milliseconds: 500),
              width: isMobile ? 160 : 200,
              height: isMobile ? 200 : 250,
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
                    fontSize: isMobile ? 60 : 80,
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
