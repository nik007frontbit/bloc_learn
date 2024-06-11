import 'package:bloc_learn/bloc/email_validat_bolc/email_valdate_event.dart';
import 'package:bloc_learn/bloc/email_validat_bolc/email_validate_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/email_validat_bolc/email_validate_bloc.dart';

class EmailValidatePage extends StatelessWidget {
  EmailValidatePage({super.key});

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<EmailBloc, EmailValidateState>(
                builder: (context, state) =>
                state is EmailInErrorState
                    ? Text(
                  state.errorMessage, style: TextStyle(color: Colors.red),)
                    : SizedBox(),
            ),

            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
              onChanged: (value) =>
                  BlocProvider.of<EmailBloc>(context).add(
                      EmailTextChangeEvent(
                          email: textEditingController.text,
                          password: textEditingController1.text)),
            ),
            TextField(
              controller: textEditingController1,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              onChanged: (value) {
                print(textEditingController1);
                print(textEditingController);
                BlocProvider.of<EmailBloc>(context).add(EmailTextChangeEvent(
                    email: textEditingController.text,
                    password: textEditingController1.text));
              },
            ),
            BlocBuilder<EmailBloc, EmailValidateState>(
              builder: (context, state) =>
                  CupertinoButton(
                    onPressed: () {
                      if (state is EmailValidState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Sucess"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    child: Text("Sign up"),
                    color: state is EmailValidState
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
            ),

          ],
        ),
      ),);
  }
}
