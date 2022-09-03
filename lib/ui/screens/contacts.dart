import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/log.dart';
import 'package:stdev/core/viewmodels/contacts.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/ui/widgets/loading/skeleton/skeleton_items.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ContactsViewModel>(onModelReady: (model) async {
      await model.getContactList();
    }, builder: (context, model, index) {
      if (model.isLoading) {
        return ContactListSkeleton();
      }
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Iconsax.add),
          onPressed: () {
            Get.toNamed(RoutePath.editNewCntact.replaceAll(":id", "new"));
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(UIHelper.paddingLarge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Contact",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  optionMenu(onLogout: () {
                    model.logout();
                  }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.paddingLarge),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  model.filterContacts(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.search_normal),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UIHelper.paddingLarge,
                  vertical: UIHelper.paddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Friends",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    "Show All",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: UIHelper.paddingLarge,
                  vertical: UIHelper.paddingMedium,
                ),
                itemBuilder: (context, index) {
                  ContactModel contact = model.contacts[index];
                  return SlideInLeft(
                    duration: Duration(milliseconds: 150 * index),
                    child: InkWell(
                      onTap: () async {
                        LogDebug.error(value: 'value');

                        await Get.toNamed(RoutePath.contactDetail
                            .replaceAll(":id", "${contact.id}"));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: UIHelper.paddingMedium),
                        child: Row(
                          children: [
                            Hero(
                              tag: "avatar-${contact.id}",
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage("${contact.avatar}"),
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            UIHelper.horizontalSpaceLarge,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${contact.fullName}",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    "${contact.phone}",
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: model.contacts.length,
              ),
            ),
          ],
        ),
      );
    });
  }

  PopupMenuButton<dynamic> optionMenu({
    Function? onLogout,
  }) {
    return PopupMenuButton(
      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        switch (value) {
          case 0:
            onLogout!();
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
            leading: Icon(Iconsax.login),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ],
    );
  }
}
