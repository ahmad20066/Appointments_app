import 'package:appointments/common/local/local_repo.dart';
import 'package:appointments/locator.dart';

class Network {
  static Map<String, String> getheaders() {
    return {
      'token': locator.get<LocalRepo>().token!,
    };
  }
}
