part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final String fName;
  final String lName;
  final String phone;
  final SignupStatus status;
  final auth.User? user;

  const SignupState(
      {required this.email,
      required this.password,
      required this.fName,
      required this.lName,
      required this.phone,
      required this.status,
      this.user});

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      fName: '',
      lName: '',
      phone: '',
      status: SignupStatus.initial,
      user: null,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? fName,
    String? lName,
    String? phone,
    SignupStatus? status,
    auth.User? user,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [
        email,
        password,
        fName,
        lName,
        phone,
        status,
        user,
      ];
}
