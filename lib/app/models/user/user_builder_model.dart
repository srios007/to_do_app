import 'user_model.dart';

class UserModelBuilder {
  DateTime? _createdAt;
  String? _email;
  String? _id;
  String? _lastname;
  String? _name;

  UserModelBuilder setCreatedAt(DateTime createdAt) {
    _createdAt = createdAt;
    return this;
  }

  UserModelBuilder setEmail(String email) {
    _email = email;
    return this;
  }

  UserModelBuilder setId(String id) {
    _id = id;
    return this;
  }

  UserModelBuilder setLastname(String lastname) {
    _lastname = lastname;
    return this;
  }

  UserModelBuilder setName(String name) {
    _name = name;
    return this;
  }

  UserModel build() {
    return UserModel(
      createdAt: _createdAt,
      email: _email,
      id: _id,
      lastname: _lastname,
      name: _name,
    );
  }
}
