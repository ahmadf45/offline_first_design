import 'package:flutter/material.dart';
import 'package:offline_first_design/infrastructures/misc/route_argument.dart';

/// Base class to handle every logic in every single page
abstract class BaseController extends ChangeNotifier
    with WidgetsBindingObserver {
  BaseController({RouteArguments? arguments}) {
    _isMounted = true;
    args = arguments;
    onInitState();
    onInitListeners();
  }

  late BuildContext _context;
  BuildContext get context => _context;
  late double _scaleWidth;
  double get scaleWidth => _scaleWidth;
  RouteArguments? args;

  bool _isMounted = false;
  bool get isMounted => _isMounted;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  /// for handle initial state on the page
  @protected
  void onInitState() {}

  /// for handle listener on the page
  @protected
  void onInitListeners() {}

  /// for save state of context that can be used on controller class
  void setContext(BuildContext newContext) {
    _context = newContext;
    _scaleWidth = MediaQuery.of(context).size.width / 360;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  /// for refreshing UI when state changed
  @protected
  void refreshUI() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  @protected
  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @protected
  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  @protected
  void onInActive() {}

  @protected
  void onPaused() {}

  @protected
  void onResumed() {}

  void loadOnStart() {
    _isLoading = true;
  }

  void dismissLoading() {
    _isLoading = false;
    refreshUI();
  }
}
