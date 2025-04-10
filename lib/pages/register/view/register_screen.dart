import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../alert/alert_type.dart';
import '../../../alert/my_alert.dart';
import '../../../components/my_loading_view.dart';
import '../../../components/my_text_field.dart';
import '../../../components/password_validation/password_validation.dart';
import '../../../theme/colors/my_colors.dart';
import '../logic/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // back button
              Column(
                children: [
                  Align(alignment: Alignment.centerLeft, child: IconButton(onPressed: Get.back, icon: Icon(PhosphorIcons.arrowLeft()))),
                  Text('Register', style: Get.theme.textTheme.titleLarge),
                ],
              ),

              Column(
                children: [
                  // username field
                  MyTextField(
                    textField: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.onUsernameChanged,
                      decoration: InputDecoration(labelText: 'Username', hintText: 'Enter your username', prefixIcon: Icon(PhosphorIcons.user())),
                    ),
                  ),

                  const Gap(16),

                  // email field
                  MyTextField(
                    textField: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.onEmailChanged,
                      decoration: InputDecoration(labelText: 'Email', hintText: 'Enter your email', prefixIcon: Icon(PhosphorIcons.voicemail())),
                    ),
                  ),

                  const Gap(16),

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

                  // password rules
                  PasswordValidation(password: controller.state.password),

                  const Gap(32),
                ],
              ),

              // register button
              ObxValue((isButtonActive) {
                return ElevatedButton(
                  onPressed: !isButtonActive.value ? null : _register,
                  child: ObxValue((isLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isLoading.value) ...[const MyLoadingView(color: MyColors.onPrimary), const Gap(12)],
                        const Text('Register'),
                      ],
                    );
                  }, controller.state.isLoading),
                );
              }, controller.state.isButtonActive),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    final (success, response) = await controller.register();

    if (!success) {
      await MyAlert.instance.showDialog(apiErrorResponse: response);
      return;
    }

    await MyAlert.instance.showDialog(title: 'Success', message: 'You have successfully registered', alertType: AlertType.success);
    Get.back(result: true);
  }
}
