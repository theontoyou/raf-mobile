import 'package:flutter/material.dart';
import 'package:raf_mobile/helper/constants.dart';

// const Color kOrange = Color(0xFFD9663A);
const Color kDividerGreen = Color(0xFF234A44);

class RightPage extends StatelessWidget {
  final PageController pageController;
  final VoidCallback onComplete;

  const RightPage({
    super.key,
    required this.pageController,
    required this.onComplete,
  });

  // Widget _buildCTA(BuildContext context) {
  //   // kept for compatibility - fills parent's width if used inside a padded container
  //   return GestureDetector(
  //     onTap: onComplete,
  //     child: Container(
  //       width: double.infinity,
  //       height: 64,
  //       decoration: BoxDecoration(
  //         color: Constants.primaryColor,
  //         borderRadius: BorderRadius.circular(40),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.08),
  //             blurRadius: 12,
  //             offset: const Offset(0, 6),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         children: [
  //           const SizedBox(width: 20),
  //           const Expanded(
  //             child: Text(
  //               'Next',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontFamily: 'Arial Rounded MT Bold',
  //                 color: Colors.white,
  //                 fontSize: 18.5,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: const EdgeInsets.only(right: 12),
  //             width: 46,
  //             height: 46,
  //             decoration: const BoxDecoration(
  //               color: Colors.white,
  //               shape: BoxShape.circle,
  //             ),
  //             child: const Center(
  //               child: Icon(
  //                 Icons.arrow_forward,
  //                 color: Constants.primaryColor,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Edge-to-edge CTA which we'll position at the bottom of the screen (no horizontal gap)
  Widget _buildEdgeCTA(BuildContext context) {
    return GestureDetector(
      onTap: onComplete,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Expanded(
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial Rounded MT Bold',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/background_right.jpg',
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => Container(color: Colors.white),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 36, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // push content down so paragraph sits just above the CTA
                const Spacer(),

                // Paragraph placed right above the CTA
                const Text(
                  "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, make a type specimen book.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // const SizedBox(height: 18),

                // Add spacer so content won't be hidden behind the edge-to-edge button
                SizedBox(height: 64 + mq.padding.bottom),
              ],
            ),
          ),
        ),

        // Edge-to-edge Next button
        Positioned(
          left: 0,
          right: 0,
          bottom: mq.padding.bottom + 12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SafeArea(
              top: false,
              bottom: false,
              child: _buildEdgeCTA(context),
            ),
          ),
        ),
      ],
    );
  }
}
