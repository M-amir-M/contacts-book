import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/viewmodels/contact_detail.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/ui/widgets/loading/circle/circle.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ContactDetailViewModel>(onModelReady: (model) async {
      await model.getContactDetail(Get.parameters["id"]!);
    }, builder: (context, model, index) {
      if (model.isLoading) {
        return Scaffold(
          body: Center(
            child: CircleSpin(),
          ),
        );
      }
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(UIHelper.paddingLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back(result: true);
                      },
                      icon: Icon(Iconsax.arrow_left_2),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: optionMenu(
                        onDelete: () {
                          Get.defaultDialog(
                            navigatorKey: Get.key,
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Do you want to delete contact?",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            title: "Delete",
                            textConfirm: "Yes",
                            confirmTextColor:
                                Theme.of(context).colorScheme.primary,
                            textCancel: "No",
                            cancelTextColor:
                                Theme.of(context).colorScheme.error,
                            onConfirm: () {
                              Get.back();
                              model.deleteContact();
                            },
                          );
                        },
                        onEdit: () {
                          Get.toNamed(RoutePath.editNewCntact
                              .replaceAll(":id", model.contact!.id!));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "avatar-${model.contact?.id}",
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                      "${model.contact?.avatar}"),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              UIHelper.verticalSpaceLarge,
              Text(
                "${model.contact?.fullName}",
                style: Theme.of(context).textTheme.headline6,
              ),
              UIHelper.verticalSpaceXSmall,
              Text(
                "${model.contact?.phone}",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              UIHelper.verticalSpaceLarge,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: TabBar(
                  labelStyle: Theme.of(context).textTheme.button,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                  tabs: [
                    Tab(
                      height: 30,
                      text: "Details",
                    ),
                    Tab(
                      height: 30,
                      text: "Call Logs",
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceLarge,
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: UIHelper.paddingLarge),
                        children: [
                          _cardDetail(
                            icon: Icon(Iconsax.call),
                            value: model.contact?.phone ?? '',
                            lable: "Number",
                          ),
                          Divider(),
                          _cardDetail(
                            icon: Icon(Iconsax.sms),
                            value: model.contact?.email ?? '',
                            lable: "Email Address",
                          ),
                          Divider(),
                          _cardDetail(
                            icon: Icon(Iconsax.note),
                            value: model.contact?.notes ?? '',
                            lable: "Notes",
                          ),
                        ],
                      ),
                    ),

                    // second tab bar viiew widget
                    Container(
                      child: Center(
                        child: Text("Empty"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

  PopupMenuButton<dynamic> optionMenu({
    Function? onDelete,
    Function? onEdit,
  }) {
    return PopupMenuButton(
      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        switch (value) {
          case 0:
            onEdit!();
            break;
          case 1:
            onDelete!();

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
          value: 1,
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
