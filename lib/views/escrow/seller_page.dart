import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/views/escrow/components/agreement_details_entry.dart';
import 'package:esgrow/views/escrow/seller_escrow_detail_page.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: scrollPadding,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text(
              "Create a New Escrow Service",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              EsgrowTextField(label: "Product"),
              EsgrowTextField(label: "Price"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terms of Agreement",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                EsgrowAgreementCard()
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                SnackBar snackBar = const SnackBar(
                    content: Text("Service Created Successfully"));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellerEscrowDetailPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: Size(300, 50)),
              child: Text("Create Service")),
        ],
      )),
    );
  }
}

class EsgrowAgreementCard extends StatefulWidget {
  const EsgrowAgreementCard({super.key, this.agreement});
  final String? agreement;

  @override
  State<EsgrowAgreementCard> createState() => _EsgrowAgreementCardState();
}

class _EsgrowAgreementCardState extends State<EsgrowAgreementCard> {
  String? agreement;

  @override
  void initState() {
    setState(() {
      agreement = widget.agreement;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: allPadding * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: containerColor),
      child: agreement != null || agreement != ""
          ? Text(
              "Successful completion of the order",
              style: Theme.of(context).textTheme.bodySmall,
            )
          : InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                        height: 300,
                        padding: allPadding,
                        child: AgreementDetailsEntry(
                          onAgreement: (text) {
                            setState(() {
                              agreement = text;
                            });
                          },
                        ));
                  },
                );
              },
              child: Container(
                  padding: allPadding / 2,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: Icon(Icons.add)),
            ),
    );
  }
}

class EsgrowTextField extends StatelessWidget {
  const EsgrowTextField({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextField()
      ],
    );
  }
}
