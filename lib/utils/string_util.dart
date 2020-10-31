import 'package:my_weather/common/constants.dart';

class StringUtil {
  StringUtil._internal();
  static final StringUtil instance = StringUtil._internal();

  String getInitials(String name) {
    String initial = '';
    List<String> names = name != null ? name.split(' ') : [];
    names.forEach((name) {
      initial = initial + name.substring(0, 1);
    });
    return initial.toUpperCase();
  }

  String createGithublink(String username) {
    return '${URLs.GITHUB}$username';  
  }
}
