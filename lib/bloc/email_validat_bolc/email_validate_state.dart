class EmailValidateState {}

class EmailInitialState extends EmailValidateState {}
class EmailLoadingState extends EmailValidateState {}

class EmailInValidState extends EmailValidateState {}

class EmailValidState extends EmailValidateState {}

class EmailInErrorState extends EmailValidateState {
  final String errorMessage;

  EmailInErrorState(this.errorMessage);
}
