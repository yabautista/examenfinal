import 'package:flutter/cupertino.dart';
import 'package:movil_wrc_app/pages/routes/routes.dart';
//import 'package:movil_wrc_app/routes/app_routes.dart';

class HomePage {
  const HomePage({dynamic key});

  // ignore: non_constant_identifier_names
  Widget Build(BuildContext context, ref) {
    final emailCtrl = TextEditingController();
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  "https://wrc-static.enhance.diagnal.com/logo/wrc.png"),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://images.wrc.com/images/banner/wrcNewsletterL2.png",
                    scale: 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Welcome to the WRC App",
                style: TextStyle(fontSize: 32),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Please Login to continue:"),
              ),
              CupertinoTextField(
                placeholder: "Email",
                controller: emailCtrl,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CupertinoButton.filled(
                  child: const Text("Login"),
                  onPressed: () {
                    if (emailCtrl.text.isNotEmpty) {
                      ref.read(routerProvider).push();
                    } else {
                      _showAlertDialog(context, ref);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, ref) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Please enter your email to continue...'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
