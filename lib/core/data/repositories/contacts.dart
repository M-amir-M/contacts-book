import 'package:stdev/core/data/models/contact.dart';
import 'package:stdev/core/data/models/result/result.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/services/api/api_service.dart';

class ContactsRepository {
  ApiService _api = locator<ApiService>();
  List<ContactModel> _contacts = [];
  List<ContactModel> get contscts => _contacts;

  Future<Result> getContactList() async {
    var result = await _api.getContactList();
    if (result.success) {
      _contacts = List<ContactModel>.from(
        result.data.map(
          (e) => ContactModel.fromJson(e),
        ),
      );
    }
    return result;
  }
}
