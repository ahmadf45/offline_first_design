import 'package:flutter/foundation.dart';
import 'base_use_case.dart';

/// Base class to handle every presenter in every single page
abstract class BasePresenter<DOMAIN, REQUEST> extends ChangeNotifier {
  late final BaseUseCase<DOMAIN, REQUEST> _useCase;

  BasePresenter(this._useCase);

  late void Function(DOMAIN) onSuccess;
  late void Function(dynamic) onError;
  late void Function() onComplete;

  @protected
  void execute({required REQUEST request}) async {
    try {
      var data = await _useCase.execute(request: request);
      onSuccess(data);
    } catch (e) {
      onError(e);
    } finally {
      onComplete();
    }
  }

  @mustCallSuper
  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
