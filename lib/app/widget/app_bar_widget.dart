import '../../core/constants/export.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    String? title,
    Color? bgColor,
    textColor,
    VoidCallback? onLeadingTap,
    bool isShowLeading = true,
    Widget? titleWidget,
    bool? centerTitle,
    double? leadingWidth,
    List<Widget>? actions,
    PreferredSize? bottom,
    double? height,
    Widget? leading,
  })  : _title = title ?? "",
        _bgColor = bgColor,
        _textColor = textColor,
        _onLeadingTap = onLeadingTap,
        _isShowLeading = isShowLeading,
        _titleWidget = titleWidget,
        _centerTitle = centerTitle,
        _leadingWidth = leadingWidth,
        _actions = actions,
        _bottom = bottom,
        _leading = leading,
        _height = height;

  final String _title;
  final Color? _bgColor, _textColor;
  final VoidCallback? _onLeadingTap;
  final bool _isShowLeading;
  final Widget? _titleWidget;
  final bool? _centerTitle;
  final double? _leadingWidth;
  final List<Widget>? _actions;
  final PreferredSize? _bottom;
  final double? _height;
  final Widget? _leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leading,
      backgroundColor: _bgColor ?? AppColors.primaryColor,
      elevation: 0.0,
      centerTitle: _centerTitle ?? false,
      leadingWidth: _leadingWidth,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      title: _titleWidget ??
          Padding(
            padding: EdgeInsets.only(top: 20.pv),
            child: TextViewWidget(_title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: _textColor,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                )),
          ),
      actions: _actions,
      bottom: _bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height ?? 64.h);
}
