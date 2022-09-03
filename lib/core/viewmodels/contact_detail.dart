import 'package:get/get.dart';
import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/data/repositories/contacts.dart';
import 'package:stdev/core/enums/network_state.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/log.dart';
import 'package:stdev/core/utils/toast.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class ContactDetailViewModel extends BaseViewModel {
  ContactsRepository _contactsRepo = locator<ContactsRepository>();

  ContactModel? _contact;
  ContactModel? get contact => _contact;

  Future getContactDetail(String id) async {
    _contact = _contactsRepo.contscts.firstWhereOrNull((c) => c.id == id);
    LogDebug.info(value: "${id}");
    notifyListeners();
  }
}
