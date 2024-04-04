import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_button.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_text_field.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/auth/register_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/register/register_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _emailitingcontroller = TextEditingController();
  final TextEditingController _passwordeditingcontroller =
      TextEditingController();
  final TextEditingController _confirmpasswordeditingcontroller =
      TextEditingController();

  late final RegisterBloc _registerScreenBloc;
  late final LoginBloc _loginScreenBloc;

  @override
  void initState() {
    _registerScreenBloc =
        RegisterBloc(registerScreenRepository: RegisterScreenRepository());
    _loginScreenBloc =
        LoginBloc(loginScreenRepository: LoginScreenRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRegisterScreen();
  }

  Widget _buildRegisterScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.messenger,
                  size: 60, color: Theme.of(context).colorScheme.primary),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Let\'s create an account for you',
                style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Username',
                      obsecure: false,
                      controller: _usernamecontroller,
                      validator: 'Please enter user name',
                      onChanged: (userName) {
                        _registerScreenBloc.add(UserNameChanged(userName));
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      hintText: 'Email Id',
                      obsecure: false,
                      controller: _emailitingcontroller,
                      validator: 'Please enter email id',
                      onChanged: (emailId) {
                        _registerScreenBloc.add(EmailIdChanged(emailId));
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      obsecure: true,
                      controller: _passwordeditingcontroller,
                      validator: 'Please enter password',
                      onChanged: (password) {
                        _registerScreenBloc
                            .add(RegisterPasswordChanged(password));
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      validator: 'Please enter password',
                      obsecure: true,
                      controller: _confirmpasswordeditingcontroller,
                      onChanged: (confirmPassword) {
                        _registerScreenBloc
                            .add(ConfirmPasswordChanged(confirmPassword));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              BlocBuilder<RegisterBloc, RegisterState>(
                bloc: _registerScreenBloc,
                builder: (context, state) {
                  if (state != null) {
                    if (state is RegisterLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RegisterSuccess) {
                      // Navigate to the next screen on success

                      Future.delayed(Duration.zero, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider<LoginBloc>.value(
                              value: _loginScreenBloc,
                              child: LoginScreen(),
                            ),
                          ),
                        );
                      });
                      return Container(); // Replace with your navigation logic
                    } else if (state is RegisterError) {
                      return Text(state.errorMessage);
                    } else {
                      // Handle other states or return a default widget
                      return CustomButton(
                        btnLabel: 'Register',
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            _registerScreenBloc.add(RegisterButtonPressed(
                                userName: _usernamecontroller.text.toString(),
                                emailId: _emailitingcontroller.text.toString(),
                                password:
                                    _passwordeditingcontroller.text.toString(),
                                device: '',
                                deviceToken: ''));
                          }
                        },
                        loading: state is RegisterLoading?,
                      );
                    }
                  } else {
                    // Handle the case where state is null
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already a member?',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12.0),
                ),
                GestureDetector(
                    onTap: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider<LoginBloc>.value(
                                      value: _loginScreenBloc,
                                      child: const LoginScreen(),
                                    )));
                      });
                    },
                    child: Text(
                      ' Login',
                      style: GoogleFonts.montserrat(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginScreenBloc.close();
    _registerScreenBloc.close();
    super.dispose();
  }
}
