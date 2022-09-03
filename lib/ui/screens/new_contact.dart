import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/data/models/contact.dart';
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
      await model.getContactDetail(Get.parameters["id"]!);
    }, builder: (context, model, index) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UIHelper.verticalSpaceLarge,
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/profile-shot-aristocratic-girl-blouse-with-frill-lady-with-flowers-her-hair-posing-proudly-against-blue-wall_197531-14304.jpg"),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  UIHelper.verticalSpaceLarge,
                  TextField(),
                  UIHelper.verticalSpaceSmall,
                  TextField(),
                  UIHelper.verticalSpaceSmall,
                  TextField(),
                  UIHelper.verticalSpaceSmall,
                  AppButton(
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _cardDetail({
    required Widget icon,
    required String value,
    required String lable,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: UIHelper.paddingMedium),
      child: Row(
        children: [
          icon,
          UIHelper.horizontalSpaceLarge,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$value",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "$lable",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<dynamic> optionMenu() {
    return PopupMenuButton(
      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        switch (value) {
          case 0:
            break;
          case 1:
            break;
          default:
        }
      },
      icon: Icon(
        Iconsax.more,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(UIHelper.paddingMedium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 0,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Iconsax.edit),
            title: Text(
              "Edit",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
        PopupMenuItem(
          value: 0,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Iconsax.trash),
            title: Text(
              "Delete",
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      ],
    );
  }
}
