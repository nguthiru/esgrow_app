import 'package:esgrow/components/agreement_container.dart';
import 'package:esgrow/components/logo.dart';
import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/views/home/components/escrow_stats.dart';
import 'package:esgrow/views/home/components/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: allPadding * 2,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LogoText(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined))
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: HomeEscrowStats(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 2, vertical: defaultPadding * 2),
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.pending_outlined),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Text("Waiting for action...")
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "5",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: iconContainerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.arrow_right_alt_outlined)),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Agreements",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: AgreementContainer(),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
