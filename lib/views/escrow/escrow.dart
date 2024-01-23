import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/models/app_context.dart';
import 'package:esgrow/views/escrow/buyer_page.dart';
import 'package:esgrow/views/escrow/seller_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EscrowPage extends StatelessWidget {
  AppContext appContext;

  EscrowPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: allPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 2),
                child: Text(
                  "Start an Escrow Service",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF2a2a2a),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BuyerPage(appContext: appContext);
                          },
                        ));
                      },
                      child: EscrowSelectionCard(
                        assetUrl: 'assets/images/buyer.svg',
                        title: "Buyer",
                        caption: "I am buying a good or a service",
                        color: containerColor,
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding * 2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SellerPage();
                          },
                        ));
                      },
                      child: EscrowSelectionCard(
                        assetUrl: "assets/images/seller.svg",
                        title: "Seller",
                        caption: "I am selling a good or service",
                        color: containerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class EscrowSelectionCard extends StatelessWidget {
  const EscrowSelectionCard(
      {super.key,
      required this.assetUrl,
      required this.title,
      required this.caption,
      this.color = Colors.black});

  final String assetUrl;
  final String title;
  final String caption;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      padding: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding) *
          2,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        SvgPicture.asset(
          assetUrl,
          width: 70,
          height: 70,
        ),
        const SizedBox(
          height: defaultPadding * 2,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Text(
          caption,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
        )
      ]),
    );
  }
}
