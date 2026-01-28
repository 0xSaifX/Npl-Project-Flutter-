import 'package:npl_app/npl_theme.dart';
import 'package:flutter/material.dart';

class LatestItemsSection extends StatelessWidget {
  const LatestItemsSection({super.key});

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
              const Text(
                "최신 NPL 상품",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "매일 업데이트되는 최신 NPL 상품을 확인하세요.",
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
              const SizedBox(height: 50),
              // Grid
              GridView.count(
                crossAxisCount: isMobile ? 1 : 2,
                shrinkWrap: true,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1.3,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _ProductCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=600",
                    tag: "NPL",
                    title: "성수동 오피스 빌딩",
                    subtitle: "경매 • 서울 성동구",
                  ),
                  _ProductCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&q=80&w=600",
                    tag: "NPL",
                    title: "강남 고급 빌라",
                    subtitle: "매매 • 서울 강남구",
                  ),
                  _ProductCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80&w=600",
                    tag: "NPL",
                    title: "제주도 리조트",
                    subtitle: "경매 • 제주 서귀포",
                  ),
                  _ProductCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&q=80&w=600",
                    tag: "NPL",
                    title: "부산 상업 센터",
                    subtitle: "매매 • 부산 해운대",
                  ),
                ],
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                child: const Text(
                  "더 보기",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String title;
  final String subtitle;

  const _ProductCard({
    required this.imageUrl,
    required this.tag,
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
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              tag,
              style: const TextStyle(
                color: AppColors.primaryOrange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "2023-10-24", // Date placeholder
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
