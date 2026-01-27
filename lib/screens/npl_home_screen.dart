import 'package:figma/widgets/brand_section.dart';
import 'package:figma/widgets/faq_section.dart';
import 'package:figma/widgets/footer.dart';
import 'package:figma/widgets/hero_section.dart';
import 'package:figma/widgets/latest_items_section.dart';
import 'package:figma/widgets/media_section.dart';
import 'package:figma/widgets/nav_bar.dart';
import 'package:figma/widgets/popular_section.dart';
import 'package:figma/widgets/service_section.dart';
import 'package:flutter/material.dart';

class NPLHomeScreen extends StatelessWidget {
  const NPLHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            HeroSection(),
            ServiceSection(),
            LatestItemsSection(),
            BrandSection(),
            PopularSection(),
            FAQSection(),
            MediaSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
