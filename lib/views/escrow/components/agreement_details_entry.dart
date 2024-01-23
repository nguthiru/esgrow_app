import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:flutter/material.dart';

class AgreementDetailsEntry extends StatefulWidget {
  const AgreementDetailsEntry({
    super.key,
    required this.onAgreement,
  });
  final Function(String agreement) onAgreement;

  @override
  State<AgreementDetailsEntry> createState() => _AgreementDetailsEntryState();
}

class _AgreementDetailsEntryState extends State<AgreementDetailsEntry> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Enter Agreement Details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: defaultPadding * 2,
        ),
        TextField(
          controller: textEditingController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Agreement Details",
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding * 4),
          child: ElevatedButton(
              onPressed: () {
                widget.onAgreement(textEditingController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: Size(300, 50)),
              child: Text("Add Agreement")),
        )
      ],
    );
  }
}
