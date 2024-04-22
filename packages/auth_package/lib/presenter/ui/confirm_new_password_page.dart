import 'package:auth_package/presenter/stores/confirm_new_password_store.dart';
import 'package:auth_package/presenter/ui/widgets/body_container.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/text_field_custom.dart';

class ConfirmNewPasswordPage extends StatefulWidget {
  const ConfirmNewPasswordPage({super.key});

  @override
  State<ConfirmNewPasswordPage> createState() => _ConfirmNewPasswordPageState();
}

class _ConfirmNewPasswordPageState extends State<ConfirmNewPasswordPage> {
  final ConfirmNewPasswordStore store = Modular.get();
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
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 116,
                          child: CachedNetworkImage(
                            imageUrl: MediaQuery.of(context)
                                        .platformBrightness ==
                                    Brightness.dark
                                ? 'https://d3ebnpochj0915.cloudfront.net/logo_dev_white.png'
                                : 'https://d3ebnpochj0915.cloudfront.net/logo_dev_black.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Observer(builder: (context) {
                          if (store.isLoading) {
                            return const CircularProgressIndicator();
                          }
                          return Column(
                            children: [
                              TextFieldCustom(
                                onChanged: store.setCode,
                                text: 'Code',
                                prefixIcon:
                                    const Icon(Icons.confirmation_num_outlined),
                                validator: (p0) =>
                                    !store.newPasswordModel.isValidCode
                                        ? 'Code is invalid'
                                        : null,
                              ),
                              const SizedBox(height: 16),
                              TextFieldCustom(
                                onChanged: store.setNewPassword,
                                text: 'Password',
                                obscureText: store.isObscureTextPassword,
                                validator: (p0) => !store.newPasswordModel
                                            .isValidNewPassword &&
                                        store.newPassword.isNotEmpty
                                    ? 'Password is invalid'
                                    : null,
                                prefixIcon: const Icon(Icons.key_outlined),
                                suffixIcon: IconButton(
                                  onPressed: () => store.setObscureTextPassword(
                                      !store.isObscureTextPassword),
                                  icon: Icon(store.isObscureTextPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFieldCustom(
                                  onChanged: store.setConfirmPassword,
                                  text: 'Confirm Password',
                                  prefixIcon:
                                      const Icon(Icons.lock_outline_rounded),
                                  obscureText:
                                      store.isObscureTextConfirmPassword,
                                  validator: (p0) => !store.newPasswordModel
                                              .isValidConfirmPassword &&
                                          store.newPassword.isNotEmpty &&
                                          store.confirmPassword.isNotEmpty
                                      ? 'Password and Confirm Password must be equals'
                                      : null,
                                  suffixIcon: IconButton(
                                    onPressed: () => store
                                        .setObscureTextConfirmPassword(!store
                                            .isObscureTextConfirmPassword),
                                    icon: Icon(
                                        store.isObscureTextConfirmPassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                  )),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                  onPressed: store.confirmNewPassword,
                                  child: const Text('Reset My Password'))
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              BackButton(onPressed: Modular.to.pop)
            ],
          ),
        ),
      ),
    );
  }
}
