import 'package:esgrow/api/create_user.dart';
import 'package:esgrow/constants/colors.dart';
import 'package:esgrow/models/account_details.dart';
import 'package:esgrow/models/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:share_plus/share_plus.dart';

import '../../utils.dart';

class ProfilePage extends StatefulWidget {
  AppContext context;

  ProfilePage({super.key, required this.context});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: showPage(),
    )));
  }

  Widget showLoginPage() {
    return ListView(
      children: [
        const Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        Lottie.asset("assets/lottie/login.json", height: 200),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: createEmailBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: createPasswordBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: createLoginButton(),
        )
      ],
    );
  }

  Widget showPage() {
    if (widget.context.details == null) {
      return showLoginPage();
    } else {
      return showUserDetails();
    }
  }

  Widget showUserDetails() {
    var account = widget.context.details!;
    return ListView(
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: CircleAvatar(
              radius: 40,
              foregroundImage: Image.asset(
                "assets/images/person.jpg",
                fit: BoxFit.cover,
              ).image,
            ),
          ),
        ),
        Center(
            child: Text(
          "${account.firstName} ${account.lastName}",
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        Center(
            child: Text(
          account.email,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8)),
        )),
        Center(
            child: Text(
          "@${account.username}",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.6)),
        )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: containerColor.withOpacity(0.5),
              border: const Border.symmetric(
                  horizontal: BorderSide(color: Colors.white, width: 0.3))),
          child: Row(
            children: [
              const Text(
                "SENDER ID:",
                style: TextStyle(fontSize: 12),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  account.id,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              )),
              IconButton(
                  onPressed: () {
                    //Share.share("https://esgrow.org/trade/${account.id}");
                  },
                  icon: const Icon(Icons.ios_share, size: 22)),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "https://esgrow.org/trade/${account.id}"));
                  },
                  icon: const Icon(Icons.copy, size: 22))
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text("My QR Code", style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: QrImageView(
            data: "https://esgrow.org/trade/${account.id}",
            eyeStyle: const QrEyeStyle(
                color: Colors.white, eyeShape: QrEyeShape.square),
            dataModuleStyle: const QrDataModuleStyle(
                color: Colors.white, dataModuleShape: QrDataModuleShape.square),
          ),
        ),
      ],
    );
  }

  Widget createEmailBox() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.alternate_email),
        isDense: false,
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        label: Text("Username",
            style:
                TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7))),
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget createPasswordBox() {
    return TextField(
      onChanged: (newValue) {},
      controller: passwordController,
      obscureText: showPassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            showPassword ^= true;
            setState(() {});
          },
          icon: showPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        isDense: false,
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        label: Text("Password",
            style:
                TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7))),
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget createLoginButton() {
    return InkWell(
      onTap: () async {
        if (emailController.text.isEmpty) {
          showOverlayError("Username field is empty");
          return;
        }
        try {
          EasyLoading.show(status: "Loading..");
          AccountDetails? details =
              await login(emailController.text, passwordController.text);
          if (details != null) {
            widget.context.details = details;
            setState(() {});
          } else {
            showOverlayError("Could not load account details");
          }
        } on Exception catch (e) {
          showOverlayError(e.toString());
        } finally {
          EasyLoading.dismiss();
        }
      },
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(3)),
        child: const Center(
            child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
