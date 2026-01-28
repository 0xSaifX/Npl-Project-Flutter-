import 'package:npl_app/npl_theme.dart';
import 'package:flutter/material.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({super.key});

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
                "풀하우스 스토리",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "최신 업데이트와 스토리를 확인하세요.",
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
              const SizedBox(height: 50),
              if (isMobile)
                Column(
                  children: const [
                    _VideoCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=600",
                    ),
                    SizedBox(height: 20),
                    _VideoCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1554469384-e58fac16e23a?auto=format&fit=crop&q=80&w=600",
                    ),
                    SizedBox(height: 20),
                    _VideoCard(
                      imageUrl:
                          "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=600",
                    ),
                  ],
                )
              else
                Row(
                  children: const [
                    Expanded(
                      child: _VideoCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=600",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _VideoCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1554469384-e58fac16e23a?auto=format&fit=crop&q=80&w=600",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _VideoCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=600",
                      ),
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

class _VideoCard extends StatelessWidget {
  final String imageUrl;
  const _VideoCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
