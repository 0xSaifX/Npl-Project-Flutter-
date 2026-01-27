import 'package:flutter/material.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
              _ServiceById(
                id: '01',
                title: '데이터 분석',
                description: '시장 데이터를 분석하여\n정확한 인사이트를 제공합니다.',
              ),
              SizedBox(width: 20),
               _ServiceById(
                id: '02',
                title: '트렌드 예측',
                 description: 'AI 알고리즘으로\n미래 트렌드를 예측합니다.',
                 isHighlighted: true,
              ),
              SizedBox(width: 20),
               _ServiceById(
                id: '03',
                title: '투자 전략',
                 description: '최대 수익을 위한\n맞춤형 전략을 수립합니다.',
              ),
              SizedBox(width: 20),
               _ServiceById(
                id: '04',
                title: '리스크 관리',
                 description: '포괄적인 리스크 평가\n및 완화 전략.',
              ),
              ],
            ),
          ),
        ),
         const SizedBox(height: 20),
         InkWell(
           onTap: () {
             // Navigate to guide page
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content: Text('풀하우스 가이드 페이지로 이동합니다.'))
             );
           },
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
             decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(30),
             ),
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: const [
                 Text("풀하우스 가이드", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                 SizedBox(width: 10),
                 Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
               ],
             ),
           ),
         ),
         const SizedBox(height: 60),
      ],
    );
  }
}

class _ServiceById extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final bool isHighlighted;

  const _ServiceById({
    required this.id,
    required this.title,
    required this.description,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFFFF3E0) : Colors.white, // Light orange for highlight
        borderRadius: BorderRadius.circular(20),
         boxShadow: [
          if (!isHighlighted)
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the custom 3D icon
          Container(
             width: 50,
             height: 50,
             decoration: BoxDecoration(
               color: isHighlighted ? Colors.orange : Colors.grey[200],
               shape: BoxShape.circle,
             ),
             child: Center(
               child: Text(id, style: TextStyle(color: isHighlighted ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
             ),
          ),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12, height: 1.5)),
        ],
      ),
    );
  }
}
