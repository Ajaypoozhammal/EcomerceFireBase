import 'package:ecommeurcefb/Design/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override

  Widget build(BuildContext context) {
    Widget _buildFullscreenImage() {
      return Image.asset(
        'assets/b.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      );
    }
    Widget _buildImage(String assetName, [double width = 350]) {
      return Image.asset('assets/b.png', width: width);
    }

    @override

    final introKey = GlobalKey<IntroductionScreenState>();

    void _onIntroEnd(context) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()),
      );
    }

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(color: Colors.black,
        fontSize: 24,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w800,),
      bodyTextStyle: TextStyle(
          color: Color(0xFFA8A8A9),
      fontSize: 14,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: false,
        autoScrollDuration: 3000,
        infiniteAutoScroll: false,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
            ),
          ),
        ),
        // globalFooter: SizedBox(
        //   width: double.infinity,
        //   height: 60,
        //   child: ElevatedButton(
        //     child: const Text(
        //       'Make Payment',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 24,
        //         fontFamily: 'Montserrat',
        //         fontWeight: FontWeight.w800,
        //         height: 0,
        //       ),
        //     ),
        //     onPressed: () => _onIntroEnd(context),
        //   ),
        // ),
        pages: [
          PageViewModel(
            title: "Choose product",
            body:
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",

            image: _buildImage('img1.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Make Payment'",
            body:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
            image: _buildImage('img2.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title:  'Get Your Order',

            body:
    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
            image: _buildImage('img3.jpg'),
            decoration: pageDecoration,
          ),

        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text("Next"),
        done: const Text(
    'Get Started',
    textAlign: TextAlign.center,
    style: TextStyle(
    color: Color(0xFFF73658),
    fontSize: 18,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    height: 0,
    )),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ));
  }
}
