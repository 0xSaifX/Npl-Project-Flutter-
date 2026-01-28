import 'package:npl_app/npl_theme.dart';
import 'package:flutter/material.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: const Color(0xFFF9F9F9),
      child: Column(
        children: [
          const Text(
            "오늘의 인기 매물",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "오늘 가장 많이 조회된 NPL 매물",
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                _PopularCard(
                  title: "서울 아파트 경매",
                  description: "서울 중심부의 고가치 아파트.",
                  isActive: false,
                ),
                SizedBox(width: 20),
                _PopularCard(
                  title: "제주도 토지 매매",
                  description: "개발을 위한 최적의 위치.",
                  isActive: true,
                ),
                SizedBox(width: 20),
                _PopularCard(
                  title: "상가 건물",
                  description: "안정적인 수익 창출.",
                  isActive: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isActive;

  const _PopularCard({
    required this.title,
    required this.description,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryOrange : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "인기",
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : AppColors.darkText,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: isActive
                  ? Colors.white.withValues(alpha: 0.8)
                  : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "2023년 6월 24일",
            style: TextStyle(
              color: isActive
                  ? Colors.white.withValues(alpha: 0.6)
                  : Colors.grey[400],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
