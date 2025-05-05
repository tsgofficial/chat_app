import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../alert/alert_type.dart';
import '../../../alert/my_alert.dart';
import '../../../components/my_loading_view.dart';
import '../../../theme/colors/my_colors.dart';
import '../logic/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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

                ObxValue((isButtonActive) {
                  return ElevatedButton(
                    onPressed: !isButtonActive.value ? null : () => _resetPassword(controller),
                    child: ObxValue((isLoading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isLoading.value) ...[const MyLoadingView(), const Gap(12)],
                          const Text('Reset Password'),
                        ],
                      );
                    }, controller.state.isLoading),
                  );
                }, controller.state.isButtonActive),
              ],
            ),
          ),
        );
      },
    );
  }

  void _resetPassword(ForgotPasswordController controller) async {
    final (success, response) = await controller.resetPassword();
    if (!success) {
      await MyAlert.instance.showDialog(apiErrorResponse: response);
      return;
    }

    await MyAlert.instance.showDialog(
      title: 'Success',
      message: 'Password reset link sent to ${controller.state.email}',
      alertType: AlertType.success,
    );
    Get.back(result: true);
  }
}
