import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/home_page.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_button.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_text_field.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginBloc _loginScreenBloc;

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emaileditingcontroller = TextEditingController();
  final TextEditingController _passwordeditingcontroller =
      TextEditingController();

  late final LandingPageBloc landingPageBloc;

  String? _emailErrorMessage;

  @override
  void initState() {
    _loginScreenBloc = LoginBloc();
    landingPageBloc = LandingPageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.messenger,
              size: 90,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Welcome To BLOC Pattern',
              style: GoogleFonts.montserrat(fontSize: 16),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Email Id',
                    obsecure: false,
                    controller: _emaileditingcontroller,
                    validator: 'Please enter your email id',
                    onChanged: (email) {
                      /*if (email.isEmpty) {
                        setState(() {
                          _emailErrorMessage = 'Please enter your email id';
                        });
                      } else {
                        _loginScreenBloc.add(EmailChanged(email));
                      }*/
                      _loginScreenBloc.add(EmailChanged(email));
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    obsecure: true,
                    validator: 'Please enter your password',
                    controller: _passwordeditingcontroller,
                    onChanged: (password) {
                      _loginScreenBloc.add(PasswordChanged(password));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              bloc: _loginScreenBloc,
              builder: (context, state) {
                if (state != null) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is LoginSuccess) {
                    // Navigate to the next screen on success

                    Future.delayed(Duration.zero, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider<LandingPageBloc>.value(
                            value: landingPageBloc,
                            child: HomePage(),
                          ),
                        ),
                      );
                    });

                    return Container(); // Replace with your navigation logic
                  } else if (state is LoginError) {
                    return Text(state.errorMessage);
                  } else {
                    // Handle other states or return a default widget
                    return CustomButton(
                      btnLabel: 'Login',
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _loginScreenBloc.add(LoginButtonPressed());
                        }
                      },
                      loading: state is LoginLoading,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'New Member?',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12.0),
                ),
                GestureDetector(
                  onTap: () {
                    _loginScreenBloc.add(LoginButtonPressed());
                  },
                  child: Text(
                    'Register Now',
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 30)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginScreenBloc.close();
    super.dispose();
  }
}
