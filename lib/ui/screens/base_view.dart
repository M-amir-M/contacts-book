import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stdev/core/enums/connectivity_status.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/services/connectivity/connectivity.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;

  BaseView({
    required this.builder,
    this.onModelReady,
    this.onModelDispose,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();
  ConnectivityService connectivityService = locator<ConnectivityService>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) async {
        var connectionStatus = await connectivityService.getConnectionStatus();
        if (connectionStatus == ConnectivityStatus.Offline &&
            !(Get.isDialogOpen ?? false)) {
          //TODO show disconnect dialog.
        } else {
          widget.onModelReady!(model);
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model, child: Consumer<T>(builder: widget.builder));
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) widget.onModelDispose!(model);
    super.dispose();
  }
}
