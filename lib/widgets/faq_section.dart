import 'package:figma/npl_theme.dart';
import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

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
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "자주 묻는 질문",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "일반적인 질문에 대한 답변을 찾아보세요.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 40),
          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FAQTab("전체", isActive: true),
              _FAQTab("서비스"),
              _FAQTab("투자"),
              _FAQTab("계정"),
            ],
          ),
          const SizedBox(height: 40),
          // List
          const Column(
            children: [
              _FAQItem(question: "NPL 투자를 어떻게 시작하나요?"),
              Divider(),
              _FAQItem(question: "수수료는 얼마인가요?"),
              Divider(),
              _FAQItem(question: "언제든지 자금을 인출할 수 있나요?"),
              Divider(),
              _FAQItem(question: "개인정보는 안전하게 보호되나요?"),
              Divider(),
            ],
          ),
        ],
      ),
      );
      }
    );
  }
}

class _FAQTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const _FAQTab(this.text, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;

  const _FAQItem({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.darkText,
            ),
          ),
          const Icon(Icons.add, color: Colors.grey),
        ],
      ),
    );
  }
}
