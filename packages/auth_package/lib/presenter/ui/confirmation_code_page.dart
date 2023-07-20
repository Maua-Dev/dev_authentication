import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:auth_package/presenter/ui/widgets/code_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/presenter/stores/confirm_signup_store.dart';
import 'package:flutter/material.dart';

class ConfirmationCodePage extends StatefulWidget {
  const ConfirmationCodePage({super.key});

  @override
  State<ConfirmationCodePage> createState() => _ConfirmationCodePageState();
}

class _ConfirmationCodePageState extends State<ConfirmationCodePage> {
  final ConfirmSignupStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 200,
          child: CachedNetworkImage(
            imageUrl: 'https://d3ebnpochj0915.cloudfront.net/dev_logo.png',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 16),
        Observer(builder: (_) {
          if (store.isLoading) {
            return const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Confirming...'),
              ],
            );
          }
          if (store.confirmed) {
            return Column(
              children: [
                const Text('Confirmed!'),
                const SizedBox(height: 16),
                const Text('Please login'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    store.goLogin();
                  },
                  child: const Text('Login'),
                ),
              ],
            );
          }
          return Column(
            children: [
              CodeWidget(
                onChanged: store.setCode,
                onSubmitted: store.confirm,
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (context) {
                  return Text.rich(
                    TextSpan(
                      children: store.timer > 0
                          ? [
                              const TextSpan(
                                  text:
                                      'Dont receive the code? Resend Code in '),
                              TextSpan(
                                  text: '${store.timer} seconds',
                                  style: const TextStyle(color: Colors.red)),
                            ]
                          : [
                              TextSpan(
                                  text: 'Send code again',
                                  style: const TextStyle(color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = store.resendCode),
                            ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: store.confirm, child: const Text('Verify Code'))
            ],
          );
        })
      ])),
    );
  }
}
