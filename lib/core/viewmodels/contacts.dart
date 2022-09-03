import 'package:get/get.dart';
import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/data/repositories/contacts.dart';
import 'package:stdev/core/enums/network_state.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/log.dart';
import 'package:stdev/core/utils/toast.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class ContactsViewModel extends BaseViewModel {
  ContactsRepository _contactsRepo = locator<ContactsRepository>();

  List<ContactModel> get contacts => _contactsRepo.contscts;

  Future<bool> getContactList() async {
    setState(NetworkState.BUSY);
    notifyListeners();

    var result = await _contactsRepo.getContactList();

    if (result.success) {
      setState(NetworkState.COMPLETE);
      notifyListeners();
      LogDebug.info(value: contacts);
      return true;
    } else {
      ToastUtil.showErrorToast(message: result.parseAllErrors().message);
      setState(NetworkState.ERROR);
      notifyListeners();

      return false;
    }
  }
}
