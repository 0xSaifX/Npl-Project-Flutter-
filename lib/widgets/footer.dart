import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 1100;
        
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 30 : 60,
            horizontal: isMobile ? 20 : 100,
          ),
          color: const Color(0xFF111111),
          child: Column(
            children: [
              if (isMobile) 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LogoColumn(),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _FooterColumn(
                          title: "회사",
                          items: const ["소개", "팀", "채용", "블로그"],
                        )),
                        Expanded(child: _FooterColumn(
                          title: "서비스",
                          items: const ["NPL 경매", "컨설팅", "분석", "리포트"],
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _FooterColumn(
                      title: "고객지원",
                      items: const ["고객센터", "이용약관", "개인정보처리방침", "문의하기"],
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LogoColumn(),
                    const Spacer(),
                    _FooterColumn(
                      title: "회사",
                      items: const ["소개", "팀", "채용", "블로그"],
                    ),
                    const SizedBox(width: 60),
                    _FooterColumn(
                      title: "서비스",
                      items: const ["NPL 경매", "컨설팅", "분석", "리포트"],
                    ),
                    const SizedBox(width: 60),
                    _FooterColumn(
                      title: "고객지원",
                      items: const ["고객센터", "이용약관", "개인정보처리방침", "문의하기"],
                    ),
                  ],
                ),
              const SizedBox(height: 60),
              const Divider(color: Colors.white24),
              const SizedBox(height: 30),
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "© 2023 FULLHOUSE. 모든 권리 보유.",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  if (isMobile) const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.facebook, color: Colors.white, size: 20),
                      SizedBox(width: 20),
                      Icon(Icons.camera_alt, color: Colors.white, size: 20),
                      SizedBox(width: 20),
                      Icon(Icons.alternate_email, color: Colors.white, size: 20),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}

class _LogoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "FULLHOUSE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "NPL 마케팅 플랫폼\n스마트한 투자의 시작.",
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                item,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            )),
      ],
    );
  }
}
