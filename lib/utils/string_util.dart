class StringUtil {
  StringUtil._internal();
  static final StringUtil instance = StringUtil._internal();

  bool isValidEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:!#$%^&*\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool isValidPassword(String value) {
    String pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  String getInitials(String name) {
    String initial = '';
    List<String> names = name != null ? name.split(' ') : [];
    names.forEach((name) {
      initial = initial + name.substring(0, 1);
    });
    return initial.toUpperCase();
  }
}
