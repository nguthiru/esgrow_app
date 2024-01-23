import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:flutter/material.dart';

class AgreementContainer extends StatelessWidget {
  const AgreementContainer({super.key, this.showCustomer = true});
  final bool showCustomer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: cardColor),
      padding: allPadding * 2,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    "Next Step",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  Text(
                    "Customer Approval",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Large Modern Sofa",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "KES 45000",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.history,
                            color: Colors.grey,
                            size: 15,
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Text(
                            "3 hours ago",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: defaultPadding * 2,
          ),
          showCustomer
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding, horizontal: defaultPadding),
                  decoration: const BoxDecoration(color: iconContainerColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2),
                            child: Text(
                              "Customer",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          Text(
                            "Erastus Wachiuri",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 12,
                                ),
                          )
                        ],
                      ),
                      Text(
                        "3443322",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
