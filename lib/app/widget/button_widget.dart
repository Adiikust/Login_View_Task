import 'package:login_screen_task/core/constants/export.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final bool isLoading;
  final Widget? child;

  const ButtonWidget(
      {this.title,
      this.color,
      this.textColor,
      required this.onTap,
      this.child,
      this.width,
      this.height,
      this.radius,
      this.isLoading = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        height: height ?? 56.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          // border: Border.all(color: AppColors.primaryColor),
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        child: child ??
            Center(
                child: Text(isLoading ? 'Please wait...' : title.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor ?? AppColors.whiteColor,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ))),
      ),
    );
  }
}
