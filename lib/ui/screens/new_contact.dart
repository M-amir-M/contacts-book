import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/utils/validator/validator.dart';
import 'package:stdev/core/viewmodels/contact_detail.dart';
import 'package:stdev/core/viewmodels/contacts.dart';
import 'package:stdev/core/viewmodels/new_contact.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/ui/widgets/buttons/button.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<NewContactViewModel>(onModelReady: (model) async {
      String id = Get.parameters["id"]!;
      if (id == "new") {
      } else {
        await model.getContactDetail(id);
        firstNameController.text = model.contact!.firstName!;
        lastNameController.text = model.contact!.lastName!;
        phoneController.text = model.contact!.phone!;
        emailController.text = model.contact!.email!;
        notesController.text = model.contact!.notes!;
      }
    }, builder: (context, model, index) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(UIHelper.paddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Iconsax.arrow_left_2),
                        ),
                        Spacer(),
                      ],
                    ),
                    UIHelper.verticalSpaceLarge,
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/profile-shot-aristocratic-girl-blouse-with-frill-lady-with-flowers-her-hair-posing-proudly-against-blue-wall_197531-14304.jpg"),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    UIHelper.verticalSpaceXLarge,
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        label: Text("First Name"),
                        prefix: Icon(Iconsax.user),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "First Name is required",
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        label: Text("Last Name"),
                        prefix: Icon(Iconsax.user),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "Last Name is required",
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                        prefix: Icon(Iconsax.call),
                      ),
                      keyboardType: TextInputType.number,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "Phone Number is required",
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text("Email Address"),
                        prefix: Icon(Iconsax.sms),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "Email Address is required",
                          ),
                          EmailValidator(
                            errorText: "Email Address is not correct",
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    TextFormField(
                      controller: notesController,
                      decoration: InputDecoration(
                        label: Text("Notes"),
                        prefix: Icon(Iconsax.note),
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText: "Notes is required",
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    AppButton(
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          model.contact = model.contact?.copyWith(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            notes: notesController.text,
                          );
                          model.contact?.id == null
                              ? model.createContact()
                              : model.editContact();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
