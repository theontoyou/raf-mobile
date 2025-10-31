import 'package:flutter/material.dart';
import 'package:raf_mobile/helper/constants.dart';

const Color kDividerGreen = Color(0xFF234A44);

class LeftPage extends StatelessWidget {
  final PageController pageController;
  final VoidCallback onNext;

  const LeftPage({
    super.key,
    required this.pageController,
    required this.onNext,
  });

  // Regular CTA (kept for consistency)
  // Widget _buildCTA(BuildContext context) {
  //   return GestureDetector(
  //     onTap: onNext,
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
  //               'Get Started',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontFamily: 'Arial Rounded MT Bold',
  //                 color: Colors.white,
  //                 fontSize: 20,
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

  // Edge-to-edge CTA (no horizontal gaps)
  Widget _buildEdgeCTA(BuildContext context) {
    return GestureDetector(
      onTap: onNext,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(32), // smoother corners
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
                'Get Started',
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
        // background image for the left page
        Image.asset(
          'assets/images/background_left.jpg',
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => Container(color: Colors.white),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 36, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),

                const Text(
                  'Real People, Real\nStories',
                  style: TextStyle(
                    fontFamily: 'Arial Rounded MT Bold',
                    fontSize: 32,
                    height: 1.02,
                    color: kDividerGreen,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333333),
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // const SizedBox(height: 18),

                // Add space so content doesn’t overlap button
                SizedBox(height: 64 + mq.padding.bottom),
              ],
            ),
          ),
        ),

        // Edge-to-edge Get Started button
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
