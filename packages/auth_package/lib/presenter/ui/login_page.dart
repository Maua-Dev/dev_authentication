import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/presenter/stores/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'widgets/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get<LoginStore>();
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
                  onFieldSubmitted: (value) async {
                    store.password.isEmpty
                        ? FocusScope.of(context).nextFocus()
                        : await store.loginEmail();
                  },
                  text: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                TextFieldCustom(
                  onChanged: store.setPassword,
                  onFieldSubmitted: (value) async {
                    await store.loginEmail();
                  },
                  text: 'Password',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.key_outlined),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed('./forgot-password');
                  },
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                        )),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      await store.loginEmail();
                    },
                    child: const Text('Login')),
                const SizedBox(height: 24),
                OutlinedButton(
                    onPressed: () {
                      Modular.to.pushNamed('./new');
                    },
                    child: const Text('Create Account'))
              ],
            );
          }),
        ],
      ),
    ));
  }
}
