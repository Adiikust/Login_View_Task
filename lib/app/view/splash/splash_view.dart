import 'package:login_screen_task/core/constants/export.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _splashDuration();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 360).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * (3.1416 / 180),
            child: child,
          );
        },
        child: Icon(
          Icons.star,
          size: 100.sp,
          color: AppColors.whiteColor,
        ).center(),
      ),
    );
  }

  void _splashDuration() {
    Future.delayed(const Duration(seconds: 6), () async {
      context.pushReplacementNamed(
          FirebaseAuth.instance.currentUser?.uid != null
              ? RouteNames.homeView
              : RouteNames.loginView);
    });
  }
}
