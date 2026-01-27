import 'package:figma/npl_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80, 
            horizontal: isMobile ? 20 : 100
          ),
          child: Column(
            children: [
               const Text(
                "오직 풀하우스",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
               Text(
                "여기서만 제공되는 특별한 파트너십과 혜택.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 50),
              GridView.count(
                 crossAxisCount: isMobile ? 2 : 3,
                 shrinkWrap: true,
                 mainAxisSpacing: 20,
                 crossAxisSpacing: 20,
                 childAspectRatio: 1.8,
                 physics: const NeverScrollableScrollPhysics(),
                 children: const [
                   _BrandCard(
                     name: "Klarna.",
                     color: Color(0xFFFBAFBA), // Pink
                     icon: null, // Text logo
                     description: "유연한 결제",
                   ),
                   _BrandCard(
                     name: "",
                     color: Color(0xFFFFF8E1), // Light Yellow
                     icon: FontAwesomeIcons.ccMastercard,
                     iconColor: Colors.orange,
                     description: "마스터카드 특별 혜택",
                   ),
                   _BrandCard(
                     name: "Skrill",
                     color: Color(0xFFE3F2FD), // Light Blue
                     icon: null,
                     description: "디지털 지갑",
                   ),
                    _BrandCard(
                     name: "amazon",
                     color: Color(0xFFFFF3E0), // Beige
                     icon: FontAwesomeIcons.amazon,
                     isIconBrand: true,
                     description: "쇼핑 리워드",
                   ),
                    _BrandCard(
                     name: "",
                     color: Color(0xFFFFFDE7), // Light Yellow
                     icon: FontAwesomeIcons.bitcoin,
                     iconColor: Colors.orange,
                     description: "암호화폐 혜택",
                   ),
                    _BrandCard(
                     name: "VISA",
                     color: Color(0xFF1A237E), // Dark Blue
                     icon: FontAwesomeIcons.ccVisa,
                     iconColor: Colors.white,
                     description: "글로벌 액세스",
                   ),
                 ],
              ),
            ],
          ),
        );
      }
    );
  }
}

class _BrandCard extends StatelessWidget {
  final String name;
  final Color color;
  final IconData? icon;
  final Color? iconColor;
  final bool isIconBrand;
  final String description;

  const _BrandCard({
    required this.name,
    required this.color,
    this.icon,
    this.iconColor,
    this.isIconBrand = false,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Center(
            child: icon != null
                ? FaIcon(icon, size: 40, color: iconColor ?? Colors.black)
                : Text(name, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("HOT", style: TextStyle(color: AppColors.primaryOrange, fontWeight: FontWeight.bold, fontSize: 10)),
                Text(description, style: TextStyle(color: iconColor == Colors.white ? Colors.white70 : Colors.black54, fontSize: 10)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
