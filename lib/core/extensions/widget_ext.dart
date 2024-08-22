import '../constants/export.dart';

extension WidgetExtension on Widget {
  GestureDetector onTap(VoidCallback? onTap, {Key? key}) =>
      GestureDetector(key: key, onTap: onTap, child: this);

  /// Padding widget extensions
  Padding defaultPadding({double? horizontal, double? vertical}) => Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 16.ph, vertical: vertical ?? 16.pv),
      child: this);

  /// Align widget extensions
  Align center() => Align(child: this);
  Align topLeft() => Align(alignment: Alignment.topLeft, child: this);
  Align topRight() => Align(alignment: Alignment.topRight, child: this);
  Align bottomLeft() => Align(alignment: Alignment.bottomLeft, child: this);
  Align bottomRight() => Align(alignment: Alignment.bottomRight, child: this);
  Align centerLeft() => Align(alignment: Alignment.centerLeft, child: this);
  Align centerRight() => Align(alignment: Alignment.centerRight, child: this);
  Align topCenter() => Align(alignment: Alignment.topCenter, child: this);
  Align bottomCenter() => Align(alignment: Alignment.bottomCenter, child: this);
}
