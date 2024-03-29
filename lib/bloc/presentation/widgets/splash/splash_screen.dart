import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/widgets/splash/components/body.dart';
import 'package:flutter_sample_bloc_pattern/config/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}






/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sample_bloc_pattern/common/constants.dart';
import 'package:flutter_sample_bloc_pattern/common/strings.dart';
import 'package:flutter_sample_bloc_pattern/presentation/routes/routes.dart';
import 'package:flutter_sample_bloc_pattern/presentation/theme/colors.dart';
import 'package:flutter_sample_bloc_pattern/presentation/theme/typography.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        Future.delayed(splashDuration, () {
          context.router.replaceAll(const [HomeRoute()]);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            StringConstants.appName,
            style: AppTypography.headline1.copyWith(color: AppColors.white),
          ).animate().fadeIn(duration: animationDuration),
        ),
      ),
    );
  }
}*/
