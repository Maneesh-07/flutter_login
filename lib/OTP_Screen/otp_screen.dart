
import 'package:flutter/material.dart';
import 'package:flutter_login/core/color.dart';
import 'package:flutter_login/core/constants.dart';
import 'package:flutter_login/home/home_page.dart';
import 'package:flutter_login/login/login_screen.dart';
import 'package:flutter_login/widgets/internet_connectivity_controller.dart';
import 'package:get/get.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/textform_widget.dart';

class CheckLoginOtp extends StatelessWidget {
  const CheckLoginOtp({super.key, required this.mobile});

  final String mobile;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    final ConnectivityService connectivityService = Get.find();

    return Obx(() {
      if (!connectivityService.hasInternetConnection.value) {
        return connectivityService.showAlert(context);
      }
      return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backgroundcolor,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: kWhiteColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 250, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    label: 'Verify your phone number',
                    fontSize: 24,
                  ),
                  kHeight,
                  const CustomText(
                    label: 'Enter the 6 digit code sent to',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    label: mobile,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  kHeight,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormFieldWidget1(
                      lableText: 'Verification Code',
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    ),
                  ),
                  ButtonWidget(
                      label: 'Continue',
                      onTap: () {
                        verifyOtp(otpController.text.trim());
                      },
                      buttonColor: colorRed)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  verifyOtp(String otp) async {
    bool verified = await a.verifyOTP(a.userVerificationId, otp);
    // bool isExisist = await UserDetails().isUserIdExists(mobile);
    if (verified) {
      Get.offAll(() => const HomeScreen());

      
    } else {
      return;
    }
  }
}
