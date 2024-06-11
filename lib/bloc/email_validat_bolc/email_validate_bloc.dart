import 'package:bloc_learn/bloc/email_validat_bolc/email_validate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_valdate_event.dart';

class EmailBloc extends Bloc<EmailValidateEvent, EmailValidateState> {
  EmailBloc() : super(EmailInitialState()) {
    on<EmailTextChangeEvent>(
      (event, emit) {

        print("jefnefeb");
        if (event.email == "") {
          print("object1");
          emit(EmailInErrorState("Enter valid email address"));
        } else if (event.password.length < 8) {
          print("object2");
          emit(EmailInErrorState("Enter Valid Password"));
        } else {
          print("object");
          print("object");
          print("object");
          emit(EmailValidState());
        }
      },
    );
    on<EmailSubmitChangeEvent>(
      (event, emit) {
        emit(EmailLoadingState());
      },
    );
  }
}
