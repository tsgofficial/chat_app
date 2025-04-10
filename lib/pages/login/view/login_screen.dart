import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../alert/my_alert.dart';
import '../../../components/my_loading_view.dart';
import '../../../components/my_text_field.dart';
import '../../../components/password_validation/password_validation.dart';
import '../../../theme/colors/my_colors.dart';
import '../../register/suite/register_routes.dart';
import '../logic/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Login', style: Get.theme.textTheme.titleLarge),
                  Column(
                    children: [
                      // email field
                      MyTextField(
                        textField: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: controller.onEmailChanged,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email or username',
                            prefixIcon: Icon(PhosphorIcons.user()),
                          ),
                        ),
                      ),

                      const Gap(32),

                      // password field
                      ObxValue((isVisiblePassword) {
                        return MyTextField(
                          textField: TextField(
                            obscureText: !isVisiblePassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: controller.onPasswordChanged,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: Icon(PhosphorIcons.password()),
                              suffix: GestureDetector(
                                onTap: controller.onVisiblePasswordChanged,
                                child: Icon(isVisiblePassword.value ? PhosphorIcons.eyeClosed() : PhosphorIcons.eye()),
                              ),
                            ),
                          ),
                        );
                      }, controller.state.isVisiblePassword),

                      const Gap(16),

                      // password validation progress
                      PasswordValidation(password: controller.state.password),

                      const Gap(32),
                    ],
                  ),
                  Column(
                    children: [
                      // login button
                      ObxValue((isButtonActive) {
                        return ElevatedButton(
                          onPressed: !isButtonActive.value ? null : () => _login(controller),
                          child: ObxValue((isLoading) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isLoading.value) ...[const MyLoadingView(color: MyColors.onPrimary), const Gap(12)],
                                const Text('Login'),
                              ],
                            );
                          }, controller.state.isLoading),
                        );
                      }, controller.state.isButtonActive),

                      const Gap(12),

                      // register button
                      ElevatedButton(
                        onPressed: () async {
                          await Get.toNamed(RegisterRoutes.register);
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _login(LoginController controller) async {
    final (success, response) = await controller.login();

    if (!success) {
      await MyAlert.instance.showDialog(apiErrorResponse: response);
      return;
    }
  }
}
