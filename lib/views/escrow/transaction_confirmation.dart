import 'package:esgrow/components/agreement_container.dart';
import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/models/app_context.dart';
import 'package:esgrow/views/home/home.dart';
import 'package:esgrow/views/home/homepage.dart';
import 'package:flutter/material.dart';

String escrowAgreementText =
    "The escrow agreement, pivotal in the sale of furniture between the Buyer and Seller and facilitated by the Escrow Agent, prioritizes the secure and efficient delivery of the purchased items. Acting as a safeguard, this agreement ensures that the funds are securely held until the specified conditions in the purchase agreement, such as successful delivery and acceptance of the furniture, are met. ";

class TransactionConfirmation extends StatelessWidget {
  AppContext appContext;

  TransactionConfirmation({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: scrollPadding,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      foregroundImage: Image.asset(
                    "assets/images/person.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ).image),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Good Harvest Funitures",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AgreementContainer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business Terms",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: Text(
                          escrowAgreementText,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  height: 2,
                                  color:
                                      const Color.fromARGB(255, 212, 212, 212)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Decline",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(150, 50),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  width: defaultPadding * 2,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Execute after 4 seconds

                    Future.delayed(const Duration(seconds: 5), () {
                      const SnackBar snackBar = SnackBar(
                        content: Text("Agreement Placed Successfully"),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Homepage(appContext: appContext);
                        },
                      ));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Accept",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
