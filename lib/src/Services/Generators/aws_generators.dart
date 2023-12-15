import 'dart:math';

class AwsGenerators {
  /// [year] returns a list of years
  /// [start] and [finish] can be used to set the start year and last year
  static List<int> year({int? start, int? finish}) {
    const int localStart = 1922;
    final int localFinish = DateTime.now().year;
    final y = localFinish - localStart;
    return List<int>.generate(y, (index) => localStart + (index + 1));
  }

  /// Generate email addresses from a list of users
  /// and a given domain, removing spaces and characters not allowed in users.
  ///
  /// Takes a list of [users] containing the user data and an email [domain].
  /// Clear each user by removing leading and trailing spaces, as well as
  /// characters not allowed in an email, and then concatenates them with the domain
  /// to form valid email addresses.
  ///
  /// [emails]: Returns a list of strings representing valid email addresses.
  static List<String> emails(List<String> users, String domain) {
    List<String> emails = [];

    for (String user in users) {
      // Clear the user to remove spaces and characters not allowed in an email
      String userClean =
          user.trim().replaceAll(RegExp(r'[^\w\.@]'), '').toLowerCase();

      // Form the email address and add it to the list
      String email = "$userClean@$domain";
      emails.add(email);
    }

    return emails;
  }

  static String key(int length) {
    const chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+{}[]|:;<>,.?/~";

    Random random = Random.secure();
    String newKey = "";

    for (int i = 0; i < length; i++) {
      int index = random.nextInt(chars.length);
      newKey += chars[index];
    }

    return newKey;
  }
}
