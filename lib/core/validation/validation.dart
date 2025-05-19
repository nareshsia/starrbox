class Validation {
  static String? name(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your name";
    }
    return null; // null means no error
  }

  static String? email(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "Please enter your email";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
        .hasMatch(email.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? dob(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter date of birth";
    }
    return null; // null means no error
  }

  static String? addressLine1(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your address line 1";
    }
    return null; // null means no error
  }

  static String? addressLine2(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your address line 2";
    }
    return null; // null means no error
  }

  static String? pinCode(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your pinCode";
    }
    return null; // null means no error
  }

  static String? state(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your state";
    }
    return null; // null means no error
  }

  static String? district(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Please enter your district";
    }
    return null; // null means no error
  }

// You can add more: phone, dob, etc.
}
