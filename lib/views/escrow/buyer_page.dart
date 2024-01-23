import 'dart:developer';

import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/views/escrow/components/qr_page.dart';
import 'package:esgrow/views/escrow/transaction_confirmation.dart';
import 'package:flutter/material.dart';

class BuyerPage extends StatefulWidget {
  const BuyerPage({super.key});

  @override
  State<BuyerPage> createState() => _BuyerPageState();
}

bool isURL(String str) {
  // Regular expression for a simple URL pattern
  final RegExp urlRegExp = RegExp(
    r"^(http|https):\/\/([a-zA-Z0-9-]+\.){1,}([a-zA-Z]{2,63})(\/[a-zA-Z0-9-._~:/?#[\]@!$&'()*+,;=%]*)?$",
    caseSensitive: false,
    multiLine: false,
  );

  return urlRegExp.hasMatch(str);
}

class _BuyerPageState extends State<BuyerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String code = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              SizedBox(
                height: size.height * 0.8,
                child: QRPage(
                  onScan: (result) {
                    if (result.code != null) {
                      if (isURL(result.code!)) {
                        if (result.code != code) {
                          code = result.code!;

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Success. Seller has been found!")));

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return TransactionConfirmation();
                            },
                          ));
                        }
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: allPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text(
                        "Scan QR Code",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 70,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Text(
                            "OR",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Seller's ID",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: defaultPadding * 2,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Proceed"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            foregroundColor: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
