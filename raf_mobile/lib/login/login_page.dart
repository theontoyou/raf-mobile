import 'package:flutter/material.dart';
import 'package:raf_mobile/helper/constants.dart';

// const Color kDividerGreen = Color(0xFF234A44);
// const Color kDividerGreen = Color(0xFF234A44);

class PhoneNumberPage extends StatefulWidget {
  final PageController pageController;
  final VoidCallback onFinish;

  const PhoneNumberPage({
    super.key,
    required this.pageController,
    required this.onFinish,
  });

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final TextEditingController _phoneCtrl = TextEditingController();
  String _countryCode = '+91';
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _phoneCtrl.addListener(_validate);
  }

  void _validate() {
    final text = _phoneCtrl.text.replaceAll(RegExp(r'\D'), '');
    // basic validation: 10 digits (adjust if you accept other lengths)
    setState(() {
      _isValid = text.length == 10;
    });
  }

  @override
  void dispose() {
    _phoneCtrl.removeListener(_validate);
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (!_isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 10-digit mobile number')),
      );
      return;
    }

    // Here you would trigger OTP / backend call. For now call onFinish or navigate
    widget.onFinish();
  }

  // Widget _buildCTA(BuildContext context) {
  //   // Keep for compatibility if used elsewhere - fills parent's width
  //   return GestureDetector(
  //     onTap: _isValid ? _onContinue : null,
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
  //           const SizedBox(width: 10),
  //           const Expanded(
  //             child: Text(
  //               'Continue', 
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 color: Colors.black,
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
  //             child: Center(
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

  // Edge-to-edge CTA (no horizontal gap). We'll place this with Positioned(left:0,right:0,...)
  Widget _buildEdgeCTA(BuildContext context) {
    return GestureDetector(
      onTap: _isValid ? _onContinue : null,
      child: Container(
        height: 64,
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          color:  Constants.primaryColor,
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
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Submit',
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
              child: Center(
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

  Widget _buildPhoneInput(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
         
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: 'Mobile number',
                hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
              ),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenHeight = mq.size.height;
    final stackHeight = (screenHeight * 0.66).clamp(420.0, 820.0);

    return Stack(
      fit: StackFit.expand,
      children: [
        // background image for the phone page
        Image.asset(
          'assets/images/background_login.jpg',
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => Container(color: Colors.white),
        ),

        // Main safe-area content (keeps its padding and layout)
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 36, 34, 30),
            child: Column(
              // allow children (CTA removed from here) to expand to full width of padding
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title (matches feel of previous pages)
                Center(
                  child: const Text(
                    'Enter your mobile number here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Arial Rounded MT Bold',
                      fontSize: 30,
                      height: 1.02,
                      fontWeight: FontWeight.w900,
                      color: Constants.greenColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'We will send you an OTP to verify your number.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Arial Rounded MT Bold',
                      fontSize: 13.5,
                      color: Constants.primaryColor,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Spacer(),

                // phone input
                _buildPhoneInput(context),

                // Add bottom spacer so input / content won't be covered by the edge CTA
                SizedBox(height: 64 + mq.padding.bottom + 12),
              ],
            ),
          ),
        ),

        // Edge-to-edge CTA placed above the bottom safe area, spanning full device width (no horizontal gaps)
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
