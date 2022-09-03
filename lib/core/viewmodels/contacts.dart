import 'package:get/get.dart';
import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/data/repositories/contacts.dart';
import 'package:stdev/core/data/repositories/authentication.dart';
import 'package:stdev/core/enums/network_state.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/log.dart';
import 'package:stdev/core/utils/toast.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class ContactsViewModel extends BaseViewModel {
  ContactsRepository _contactsRepo = locator<ContactsRepository>();
  AuthRepository _authRepo = locator<AuthRepository>();

  List<ContactModel> contacts = [];

  Future<bool> getContactList() async {
    setState(NetworkState.BUSY);
    notifyListeners();

    var result = await _contactsRepo.getContactList();

    if (result.success) {
      setState(NetworkState.COMPLETE);
      contacts = _contactsRepo.contscts;
      notifyListeners();
      return true;
    } else {
      ToastUtil.showErrorToast(message: result.parseAllErrors().message);
      setState(NetworkState.ERROR);
      notifyListeners();

      return false;
    }
  }

  Future filterContacts(String search) async {
    contacts = _contactsRepo.contscts
        .where((element) => element.fullName.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future logout() async {
    await _authRepo.signOut();
    Get.offNamed(RoutePath.signIn);
    notifyListeners();
  }

  Future updateUi() async {
    notifyListeners();
  }
}
