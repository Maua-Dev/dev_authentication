import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../stores/forgot_password_store.dart';
import 'widgets/text_field_custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final ForgotPasswordStore store = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: CachedNetworkImage(
              imageUrl: 'https://d3ebnpochj0915.cloudfront.net/dev_logo.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 16),
          TextFieldCustom(
            onChanged: store.setEmail,
            onFieldSubmitted: (_) => store.resetPassword(),
            text: 'Email',
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: store.resetPassword,
              child: const Text('Reset My Password'))
        ],
      ),
    ));
  }
}
