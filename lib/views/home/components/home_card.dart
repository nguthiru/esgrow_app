import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:flutter/material.dart';

class HomeCardRow extends StatelessWidget {
  const HomeCardRow({
    super.key,
    required this.icon,
    required this.count,
    required this.text,
  });
  final Widget icon;
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 2, vertical: defaultPadding * 2),
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: allPadding,
                  decoration: BoxDecoration(
                      color: iconContainerColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: icon),
              Text(
                count.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.normal),
              )
            ],
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class HomeCardColumn extends StatelessWidget {
  const HomeCardColumn(
      {super.key, required this.icon, required this.count, required this.text});
  final Widget icon;
  final int count;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding * 2),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: allPadding,
                decoration: BoxDecoration(
                    color: iconContainerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: icon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
