import 'package:login_screen_task/core/constants/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 40.sp,
                  Icons.logout_outlined,
                  color: AppColors.whiteColor,
                )),
            SizeBoxWidget(height: 10.h),
            Text(
              StringsResource.logout,
              style: textTheme.titleLarge,
            ),
          ],
        ).center(),
      ),
    );
  }
}
