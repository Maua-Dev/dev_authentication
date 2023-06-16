import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'widgets/text_field_custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
          CachedNetworkImage(
            imageUrl: 'https://d3ebnpochj0915.cloudfront.net/dev_logo.png',
          ),
          const SizedBox(height: 16),
          const TextFieldCustom(
            // onChanged: store.setEmail,
            text: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {}, child: const Text('Reset My Password'))
        ],
      ),
    ));
  }
}
