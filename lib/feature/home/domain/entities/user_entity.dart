import 'package:equatable/equatable.dart';


class UserEntity extends Equatable {
  final String gender;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String phone;
  final String cell;
  final String picture;

  UserEntity({
    required this.gender,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.password,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  factory UserEntity.fromModel(Map<String, dynamic> map) {
    final name = map['name'] as Map<String, dynamic>;
    final location = map['location'] as Map<String, dynamic>;
    final login = map['login'] as Map<String, dynamic>;
    final picture = map['picture'] as Map<String, dynamic>;

    return UserEntity(
      gender: map['gender'].toString() + '',
      title: name['title']?.toString() ?? '',
      firstName: name['first']?.toString() ?? '',
      lastName: name['last']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      username: login['username']?.toString() ?? '',
      password: login['password']?.toString() ?? '',
      street: location['street']?['name']?.toString() ?? '',
      city: location['city']?.toString() ?? '',
      state: location['state']?.toString() ?? '',
      country: location['country']?.toString() ?? '',
      postcode: location['postcode']?.toString() ?? '',
      phone: map['phone']?.toString() ?? '',
      cell: map['cell']?.toString() ?? '',
      picture: picture['large']?.toString() ?? '',
    );
  }

  @override
  List<Object?> get props => [
    gender,
    title,
    firstName,
    lastName,
    email,
    username,
    password,
    street,
    city,
    state,
    country,
    postcode,
    phone,
    cell,
    picture,
  ];
}




