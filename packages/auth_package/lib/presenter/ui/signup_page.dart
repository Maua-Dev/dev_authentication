import 'package:auth_package/presenter/stores/signup_store.dart';
import 'package:auth_package/presenter/ui/widgets/text_button_icon_custom.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyContainer(
            child: SafeArea(
      child: Stack(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: store,
              onPageChanged: store.pageChanged,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Register Dev Mauá.',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        shrinkWrap: true,
                        children: [
                          TextButtonIconCustom(
                              onTap: () {
                                store.setIsMaua(true);
                                store.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              },
                              iconData: Icons.school_outlined,
                              title: 'Mauá'),
                          TextButtonIconCustom(
                              onTap: () {
                                store.setIsMaua(false);
                                store.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              },
                              iconData: Icons.person,
                              title: 'Externo')
                        ],
                      ),
                    )
                  ],
                ),
                Center(
                  child: SingleChildScrollView(
                    child: SignupFormWidget(
                      labelButton: 'Next',
                      buttonOnPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            await store.checkLogin()) {
                          store.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: TextFieldCustom(
                        onChanged: store.setEmail,
                        text: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (p0) => store.isMaua && !store.isEmailMaua
                            ? 'Email must be @maua.br'
                            : (!store.credential.isValidEmail
                                ? 'Email is invalid'
                                : null),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: SignupFormWidget(
                      labelButton: 'Next',
                      buttonOnPressed: () {
                        if (_formKey.currentState!.validate()) {
                          store.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: TextFieldCustom(
                        onChanged: store.setName,
                        text: 'Name',
                        prefixIcon: const Icon(Icons.person_outline),
                        validator: (p0) =>
                            store.name.isEmpty ? 'Name is empty' : null,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Observer(builder: (context) {
                      if (store.isLoading) {
                        return const Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Sign Up...'),
                          ],
                        );
                      }
                      return SignupFormWidget(
                          labelButton: 'Submit',
                          buttonOnPressed: () {
                            if (_formKey.currentState!.validate()) {
                              store.signUp();
                            }
                          },
                          child: Observer(builder: (context) {
                            return Column(
                              children: [
                                TextFieldCustom(
                                  onChanged: store.setPassword,
                                  text: 'Password',
                                  prefixIcon:
                                      const Icon(Icons.lock_outline_rounded),
                                  obscureText: true,
                                  validator: (p0) =>
                                      !store.credential.isValidPassword
                                          ? 'Password is invalid'
                                          : null,
                                ),
                                const SizedBox(height: 16),
                                TextFieldCustom(
                                  onChanged: store.setConfirmPassword,
                                  text: 'Confirm Password',
                                  prefixIcon:
                                      const Icon(Icons.lock_outline_rounded),
                                  obscureText: true,
                                  validator: (p0) => !store.isPasswordEquals &&
                                          store.password.isNotEmpty &&
                                          store.confirmPassword.isNotEmpty
                                      ? 'Password and Confirm Password must be equals'
                                      : null,
                                ),
                              ],
                            );
                          }));
                    }),
                  ),
                ),
              ],
            ),
          ),
          BackButton(
            color: Colors.white,
            onPressed: () => store.getIndexPage == 0
                ? (Modular.to.canPop()
                    ? Modular.to.pop()
                    : Modular.to.navigate('/login/'))
                : store.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
          )
        ],
      ),
    )));
  }
}

class SignupFormWidget extends StatelessWidget {
  final void Function()? buttonOnPressed;
  final String labelButton;
  final Widget child;
  const SignupFormWidget({
    super.key,
    this.buttonOnPressed,
    required this.labelButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: CachedNetworkImage(
            imageUrl:
                'https://d3ebnpochj0915.cloudfront.net/logo_dev_white.png',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 24),
        child,
        const SizedBox(height: 16),
        ElevatedButton(onPressed: buttonOnPressed, child: Text(labelButton)),
      ],
    );
  }
}
