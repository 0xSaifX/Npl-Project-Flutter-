import 'package:npl_app/widgets/brand_section.dart';
import 'package:npl_app/widgets/faq_section.dart';
import 'package:npl_app/widgets/footer.dart';
import 'package:npl_app/widgets/hero_section.dart';
import 'package:npl_app/widgets/latest_items_section.dart';
import 'package:npl_app/widgets/media_section.dart';
import 'package:npl_app/widgets/nav_bar.dart';
import 'package:npl_app/widgets/popular_section.dart';
import 'package:npl_app/widgets/service_section.dart';
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
