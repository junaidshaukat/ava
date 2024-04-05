import '/core/app_export.dart';

enum UseState {
  none,
  done,
  error,
  loading,
  processing,
  resending,
  updating,
  deleting,
  downloading
}

class Props {
  Rx<UseState> state = Rx(UseState.none);
  Rx<dynamic> error = Rx(null);

  Props();
}
