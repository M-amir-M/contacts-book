import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/data/models/user.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/validator/validator.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/core/viewmodels/auth.dart';
import 'package:stdev/ui/widgets/buttons/button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) async {},
      builder: (context, model, index) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(UIHelper.paddingLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    UIHelper.verticalSpaceXLarge,
                    TextFormField(
                      controller: emailController,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Email Address is required"),
                        EmailValidator(
                          errorText: "Email Address is not correct",
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.sms),
                        hintText: "Email",
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    TextFormField(
                      controller: passwordController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Password is required".tr),
                      ]),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        hintText: "Password",
                      ),
                    ),
                    UIHelper.verticalSpaceXLarge,
                    AppButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var data = UserModel(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (await model.signIn(data)) {
                            Get.offNamed(RoutePath.contactList);
                          }
                        }
                      },
                      isLoading: model.isLoading,
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
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
