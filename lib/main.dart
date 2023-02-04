import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _onbordingScreen(),
    );
  }
}

class _onbordingScreen extends StatefulWidget {
  const _onbordingScreen({Key? key}) : super(key: key);

  @override
  State<_onbordingScreen> createState() => _onbordingScreenState();
}

class _onbordingScreenState extends State<_onbordingScreen> {
  late RiveAnimationController _controller;
  @override
  void initState() {
    _controller = OneShotAnimation("active", autoplay: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Stack(
          children: [
            const RiveAnimation.asset(
              'assets/images/new_file.riv',
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: SizedBox(),
            )),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: SizedBox(
                      width: 500,
                      child: Text(
                        "Learn \n  to"
                        ""
                        " \ncode",
                        style: TextStyle(
                            fontSize: 60,
                            // fontFamily: 'Poppins',
                            height: 1.2,
                            fontWeight: FontWeight.w700,

                            // width: 1.2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 350,
                      child: Text(
                        "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcon .",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 230,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.isActive = true;
                      });
                    },
                    child: animation_btn(controller: _controller),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 350,
                      child: Text(
                        "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class animation_btn extends StatelessWidget {
  const animation_btn({
    Key? key,
    required RiveAnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final RiveAnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 260,
      child: Stack(
        children: [
          RiveAnimation.asset(
            'assets/images/button.riv',
            controllers: [_controller],
          ),
          Positioned.fill(
            top: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                Text("Get started",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
