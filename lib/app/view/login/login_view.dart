import 'package:login_screen_task/core/constants/export.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizeBoxWidget(height: 151.h),
              TextViewWidget(
                StringsResource.login,
                style: textTheme.displayLarge!.copyWith(
                  fontSize: 41.sp,
                  color: AppColors.pinkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizeBoxWidget(height: 150.h),
              TextFormFieldWidget(
                controller: _emailController,
                prefixIcon: const Icon(
                  Icons.alternate_email,
                  color: AppColors.whiteColor,
                ),
                hintText: StringsResource.email,
                hintColor: AppColors.whiteColor,
                validator: (email) => Validation.validateEmail(email),
              ),
              SizeBoxWidget(height: 27.h),
              TextFormFieldWidget(
                controller: _passwordController,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.whiteColor,
                ),
                hintText: StringsResource.password,
                hintColor: AppColors.whiteColor,
                validator: (password) => Validation.validatePassword(password),
              ),
              SizeBoxWidget(height: 62.h),
              ButtonWidget(
                height: 39.h,
                width: 184.w,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.pushReplacementNamed(RouteNames.homeView);
                  }
                },
                radius: 18,
                title: StringsResource.appName,
                color: AppColors.whiteColor,
                textColor: AppColors.blackColor,
              ).center()
            ],
          ).defaultPadding(horizontal: 40.w, vertical: 0),
        ),
      ),
    );
  }
}
