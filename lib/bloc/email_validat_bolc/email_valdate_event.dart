abstract class EmailValidateEvent {}

class EmailTextChangeEvent extends EmailValidateEvent {
  final String email;
  final String password;

  EmailTextChangeEvent({required this.email, required this.password});
}

class EmailSubmitChangeEvent extends EmailValidateEvent {
  final String email;
  final String password;

  EmailSubmitChangeEvent({required this.email, required this.password});
}
