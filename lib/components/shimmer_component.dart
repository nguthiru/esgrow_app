import 'package:esgrow/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  final double? height;

  const ShimmerComponent({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        //padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Shimmer.fromColors(
          baseColor: containerColor.withOpacity(0.5),
          highlightColor: Colors.white,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 20.0, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ],
                )),
            itemCount: 60,
          ),
        ));
  }
}
