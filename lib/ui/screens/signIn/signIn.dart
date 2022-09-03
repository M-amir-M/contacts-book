import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/core/viewmodels/auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) async {

      },
      builder: (context, model, index) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.paddingLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // AppDropdownInput<LocaleModel>(
                    //   options: model.locales,
                    //   hintText: "language".tr,
                    //   prefixIcon: Icon(Iconsax.language_square),
                    //   onChanged: (val) {
                    //     locale = val!;
                    //     model.updateLocale(val);
                    //   },
                    //   value: locale,
                    //   getLabel: (val) {
                    //     return val.name ?? "";
                    //   },
                    // ),
                    // UIHelper.verticalSpaceSmall,
                    // locale?.code == "fa-IR"
                    //     ? TextFormField(
                    //         controller: usernameController,
                    //         validator: MultiValidator(
                    //           [
                    //             RequiredValidator(
                    //                 errorText: "signup_phone_is_required".tr),
                    //             // IrPhoneValidator(
                    //             //   errorText: "signup_phone_is_not_correct".tr,
                    //             // ),
                    //           ],
                    //         ),
                    //         decoration: InputDecoration(
                    //           fillColor: Colors.white,
                    //           filled: true,
                    //           prefixIcon: Icon(Iconsax.mobile),
                    //           hintText: "signin_phone".tr,
                    //         ),
                    //       )
                    //     : TextFormField(
                    //         controller: usernameController,
                    //         validator: MultiValidator([
                    //           RequiredValidator(
                    //               errorText: "email_is_required".tr),
                    //           EmailValidator(
                    //             errorText: "email_is_not_correct".tr,
                    //           ),
                    //         ]),
                    //         keyboardType: TextInputType.emailAddress,
                    //         decoration: InputDecoration(
                    //           fillColor: Colors.white,
                    //           filled: true,
                    //           prefixIcon: Icon(Iconsax.sms),
                    //           hintText: "email".tr,
                    //         ),
                    //       ),
                    // UIHelper.verticalSpaceSmall,
                    // TextFormField(
                    //   controller: passwordController,
                    //   validator: MultiValidator([
                    //     RequiredValidator(
                    //         errorText: "signup_password_is_required".tr),
                    //   ]),
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.white,
                    //     filled: true,
                    //     prefixIcon: Icon(Iconsax.password_check),
                    //     hintText: "signin_password".tr,
                    //   ),
                    // ),
                    // UIHelper.verticalSpaceSmall,
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.offNamed(RoutePath.forgotPassword);
                    //   },
                    //   child: Text(
                    //     "signin_forgot_password".tr,
                    //     style: Theme.of(context).textTheme.bodyText1,
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.offNamed(RoutePath.signUp);
                    //   },
                    //   child: Text(
                    //     "signup".tr,
                    //     style: Theme.of(context).textTheme.bodyText1,
                    //   ),
                    // ),
                    // UIHelper.verticalSpaceMedium,
                    // AppButton(
                    //   onPressed: () async {
                    //     if (_formKey.currentState!.validate()) {
                    //       var data = SignInRequestModel(
                    //           username: usernameController.text,
                    //           password: passwordController.text,
                    //           type:
                    //               locale?.code == "fa-IR" ? 'PHONE' : 'EMAIL');
                    //       if (await model.signIn(data)) {
                    //         String returnUrl =
                    //             Get.parameters['return'] ?? RoutePath.home;
                    //         Get.offNamed(returnUrl);
                    //       }
                    //     }
                    //   },
                    //   isLoading: model.isLoading,
                    //   child: Text(
                    //     "signin_login".tr,
                    //     style: Theme.of(context).textTheme.button,
                    //   ),
                    // ),
                  
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
