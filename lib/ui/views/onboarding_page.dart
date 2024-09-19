import 'package:binamod_v/ui/views/upload/adrees_page.dart';
import 'package:binamod_v/ui/views/upload/building_info_pages.dart';
import 'package:binamod_v/ui/views/upload/construction_page.dart';
import 'package:binamod_v/ui/views/upload/damage_page.dart';
import 'package:binamod_v/ui/views/upload/summary_page.dart';
import 'package:binamod_v/ui/views/upload/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  final String houseName;

  const OnboardingPage({
    super.key,
    required this.houseName,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  void _nextPage() {
    if (_controller.page != null && _controller.page! < 5) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_controller.page != null && _controller.page! > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              UploadPage(houseName: widget.houseName),
              AdreesPage(),
              ConstructionPage(),
              BuildingInfoPages(),
              DamagePage(
                houseName: widget.houseName,
              ),
              SummaryPage(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onPressed: _previousPage,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 6,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ),
                  onPressed: _nextPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
