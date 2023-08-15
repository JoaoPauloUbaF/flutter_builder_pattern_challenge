class User {
  late final String _firstName;
  late final String _lastName;
  late final String _email;
  late final int? _age;
  late final String? _phoneNumber;
  late final String? _address;

  String get getFirstName => _firstName;
  String get getLastName => _lastName;
  String get getEmail => _email;
  int? get getAge => _age;
  String? get getPhoneNumber => _phoneNumber;
  String? get getAddress => _address;

  User({
    required String firstName,
    required String lastName,
    required String email,
    int? age,
    String? phoneNumber,
    String? address,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _age = age;
    _phoneNumber = phoneNumber;
    _address = address;
  }
}

abstract class UserBuilder {
  late final User user;

  User getUser();

  void createUser({
    required String firstName,
    required String lastName,
    required String email,
    required int? age,
    required String? phoneNumber,
    required String? address,
  });
}

class KidUserBuilder extends UserBuilder {
  @override
  User getUser() {
    return super.user;
  }

  @override
  void createUser({
    required String firstName,
    required String lastName,
    required String email,
    required int? age,
    String? phoneNumber,
    String? address,
  }) {
    user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      age: age,
      phoneNumber: "*******",
      address: "*******",
    );
  }
}

class AdultUserBuilder extends UserBuilder {
  @override
  User getUser() {
    return super.user;
  }

  @override
  void createUser({
    required String firstName,
    required String lastName,
    required String email,
    int? age,
    required String? phoneNumber,
    required String? address,
  }) {
    user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      age: age,
      phoneNumber: phoneNumber,
      address: address,
    );
  }
}

class UserDirector {
  late UserBuilder _builder;

  void setUserBuilder(UserBuilder builder) {
    _builder = builder;
  }

  User getUser() {
    return _builder.getUser();
  }

  void registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required int? age,
    required String? phoneNumber,
    required String? address,
  }) {
    _builder.createUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      age: age,
      phoneNumber: phoneNumber,
      address: address,
    );
  }
}
