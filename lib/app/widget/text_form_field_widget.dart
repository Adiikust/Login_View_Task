import 'package:login_screen_task/core/constants/export.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool? enable;
  final bool? readOnly;
  final double? hintFontSize;
  final Color? hintColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;

  const TextFormFieldWidget(
      {super.key,
      this.labelText,
      this.enable,
      this.readOnly,
      required this.hintText,
      this.obscureText = false,
      this.controller,
      this.onChanged,
      this.validator,
      this.maxLines = 1,
      this.keyboardType,
      this.hintColor,
      this.hintFontSize,
      this.enabledBorder,
      this.errorBorder,
      this.focusedBorder,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor,
      this.focusedErrorBorder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      enabled: enable ?? true,
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: textTheme.headlineSmall
          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp),
      decoration: InputDecoration(
        fillColor: fillColor ?? AppColors.primaryColor,
        filled: true,
        // hoverColor: AppColors.primaryColor,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
        errorStyle: TextStyle(color: AppColors.errorColor, fontSize: 12.sp),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: hintColor ?? AppColors.fieldHintColor,
          fontSize: hintFontSize ?? 16.sp,
          fontWeight: FontWeight.w400,
        ),
        // enabledBorder: enabledBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(color: AppColors.lightGreyTextColor),
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        // focusedBorder: focusedBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(color: AppColors.primaryColor),
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        // errorBorder: errorBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(color: AppColors.lightGreyTextColor),
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        // focusedErrorBorder: focusedErrorBorder ??
        //     OutlineInputBorder(
        //       borderSide: const BorderSide(color: AppColors.lightGreyTextColor),
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
      ),
    );
  }
}
