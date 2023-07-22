import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imacture/core/presentations/routes/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF141A32),
                  Color(0xFF2A3251)
                ], // Replace these colors with your desired gradient colors
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Imacture",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: height / 2,
                  width: width / 2,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ), // Set the padding here
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius here
                    ),
                    elevation:
                        0, // Set the elevation to 0 to make it completely flat
                  ),
                  onPressed: () {
                    log("dasda");
                    context.router.push(const GalleryRoute());
                  },
                  child: Text(
                    "Lets Dive",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
