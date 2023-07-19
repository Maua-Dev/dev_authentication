import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/presenter/stores/confirm_signup_store.dart';
import 'package:flutter/material.dart';

import 'widgets/text_field_custom.dart';

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
              TextFieldCustom(
                suffixIcon: IconButton(
                  onPressed: store.confirm,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
                onChanged: store.setCode,
                onFieldSubmitted: (value) async {
                  await store.confirm();
                },
                text: 'Confirmation Code',
                prefixIcon: const Icon(Icons.confirmation_number_outlined),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (context) {
                  return TextButton(
                    onPressed: store.timer > 0 ? () {} : store.resendCode,
                    child: Text.rich(TextSpan(
                        children: store.timer == 0
                            ? [
                                const TextSpan(
                                    text: 'Send code again',
                                    style: TextStyle(color: Colors.red))
                              ]
                            : [
                                const TextSpan(
                                    text:
                                        'Dont receive the code? Resend Code in ',
                                    style: TextStyle(color: Colors.white)),
                                TextSpan(
                                    text: '${store.timer} seconds',
                                    style: const TextStyle(color: Colors.red)),
                              ])),
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
