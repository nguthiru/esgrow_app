import 'package:esgrow/constants/spacings.dart';
import 'package:esgrow/views/home/components/home_card.dart';
import 'package:flutter/material.dart';

class HomeEscrowStats extends StatelessWidget {
  const HomeEscrowStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              HomeCardRow(
                icon: Icon(Icons.shopping_bag_outlined),
                count: 5,
                text: "Purchase Agreements",
              ),
              SizedBox(
                height: defaultPadding,
              ),
              HomeCardRow(
                icon: Icon(Icons.tag_outlined),
                count: 10,
                text: "Sale Agreements",
              )
            ],
          ),
          SizedBox(
            width: defaultPadding,
          ),
          HomeCardColumn(
              icon: Icon(
                Icons.folder_outlined,
                size: 30,
              ),
              count: 15,
              text: "All Agreements")
        ],
      ),
    );
  }
}
