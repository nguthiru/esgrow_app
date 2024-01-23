import 'package:esgrow/components/agreement_container.dart';
import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SellerEscrowDetailPage extends StatelessWidget {
  const SellerEscrowDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: scrollPadding,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding * 4),
              child: Column(
                children: [
                  QrImageView(
                    data: "https://www.esgrow.org/seller/service/5245242",
                    backgroundColor: Colors.white,
                    size: 200,
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  Column(
                    children: [
                      Text(
                        "Seller ID",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "542542525",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AgreementContainer(
              showCustomer: false,
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Homepage();
                  },
                ));
              },
              child: Text(
                "Go Home",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.red),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(150, 50),
                  backgroundColor: Colors.transparent,
                  foregroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}
