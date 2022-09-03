import 'package:flutter/widgets.dart';
import 'package:stdev/core/enums/network_state.dart';

class BaseViewModel extends ChangeNotifier {
  NetworkState _state = NetworkState.COMPLETE;

  NetworkState get state => _state;
  bool get isLoading => _state == NetworkState.BUSY;

  String? errorMessage;

  void setState(NetworkState viewState) {
    _state = viewState;
    notifyListeners();
  }
  
}