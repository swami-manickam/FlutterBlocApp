import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/auth/login_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/auth/register_screen_repository.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/login/login_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/register/register_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/home_page.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/screens/register_screen.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_button.dart';
import 'package:flutter_sample_bloc_pattern/components/custom_text_field.dart';
import 'package:flutter_sample_bloc_pattern/utils/app_preferences.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
  late final RegisterBloc _registerBloc;

  String? _emailErrorMessage;
  late FToast fToast;

  @override
  void initState() {
    _loginScreenBloc =
        LoginBloc(loginScreenRepository: LoginScreenRepository());
    landingPageBloc = LandingPageBloc();
    _registerBloc =
        RegisterBloc(registerScreenRepository: RegisterScreenRepository());
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoginScreen();
  }

  _showToast(String errorMessage) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: secondaryTextColor,
      ),
      child: Flexible(
        /*child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              */ /*const Icon(Icons.check),
              const SizedBox(
                width: 12.0,
              ),*/ /*
              Text(
                errorMessage,
                maxLines: 2,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ), // Display the error message here
            ],
          ),*/
        child: Text(
          errorMessage,
          maxLines: 2,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    // Delay the toast message until after the build phase is complete
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    });

    // Custom Toast Position
    /*fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });*/
  }

  Widget _buildLoginScreen() {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                // Navigation logic here
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
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.messenger, size: 90, color: textColor),
              const SizedBox(height: 30),
              Text(
                'Welcome To BLOC Pattern',
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
              const SizedBox(height: 25.0),
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
                        _loginScreenBloc.add(EmailChanged(email));
                      },
                    ),
                    const SizedBox(height: 15.0),
                    CustomTextField(
                      hintText: 'Password',
                      obsecure: true,
                      validator: 'Please enter your password',
                      controller: _passwordeditingcontroller,
                      onChanged: (password) {
                        _loginScreenBloc.add(PasswordChanged(password));
                      },
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to Forgot Password screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      BlocProvider<RegisterBloc>.value(
                                    value: _registerBloc,
                                    child: const RegisterScreen(),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.montserrat(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              BlocBuilder<LoginBloc, LoginState>(
                bloc: _loginScreenBloc,
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is LoginError) {
                    _showToast(state.errorMessage);
                    return CustomButton(
                      btnLabel: 'Login',
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _loginScreenBloc.add(LoginButtonPressed(
                            email: _emaileditingcontroller.text.toString(),
                            password:
                                _passwordeditingcontroller.text.toString(),
                            device: 'Android',
                            deviceToken: '',
                          ));
                        }
                      },
                      loading: state is LoginLoading?,
                    );
                  } else if (state is LoginSuccess) {
                    saveUserLogInStatusPref(true);
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
                    return Container();
                  } else {
                    return CustomButton(
                      btnLabel: 'Login',
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _loginScreenBloc.add(LoginButtonPressed(
                            email: _emaileditingcontroller.text.toString(),
                            password:
                                _passwordeditingcontroller.text.toString(),
                            device: 'Android',
                            deviceToken: '',
                          ));
                        }
                      },
                      loading: state is LoginLoading?,
                    );
                  }
                },
              ),
              const SizedBox(height: 30.0),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'New Member?',
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Register screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider<RegisterBloc>.value(
                            value: _registerBloc,
                            child: const RegisterScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Register Now',
                      style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginScreenBloc.close();
    landingPageBloc.close();
    _registerBloc.close();
    super.dispose();
  }
}
