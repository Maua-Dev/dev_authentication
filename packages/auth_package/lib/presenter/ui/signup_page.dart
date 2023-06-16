import 'package:auth_package/presenter/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'widgets/body_container.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'widgets/text_field_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignupStore store = Modular.get();
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
          Observer(builder: (_) {
            if (store.isLoading) {
              return const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Sign In...'),
                ],
              );
            }
            return Column(
              children: [
                TextFieldCustom(
                  onChanged: store.setEmail,
                  text: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                TextFieldCustom(
                  onChanged: store.setName,
                  text: 'Name',
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                const SizedBox(height: 16),
                TextFieldCustom(
                  onChanged: store.setPassword,
                  onFieldSubmitted: (value) async {
                    await store.signUp();
                  },
                  text: 'Password',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.key_outlined),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      await store.signUp();
                    },
                    child: const Text('Register')),
              ],
            );
          }),
        ],
      ),
    ));
  }
}
