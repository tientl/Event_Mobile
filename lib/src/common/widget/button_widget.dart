import 'package:event_app/src/common/style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String lable;
  final bool enable;
  final ButtonStyle? style;
  final Color? lableColor;

  const ButtonWidget(
      {Key? key,
      this.onPressed,
      required this.lable,
      this.onFocusChange,
      this.enable = true,
      this.onHover,
      this.backgroundColor,
      this.borderRadius,
      this.onLongPress,
      this.lableColor,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: ElevatedButton(
          style: style ??
              CommonStyle.containedButtonStyle(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  context: context,
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius),
          onPressed: enable ? onPressed : null,
          onFocusChange: onFocusChange,
          onHover: onHover,
          onLongPress: onLongPress,
          child: Text(
            lable,
            style: Theme.of(context).textTheme.button?.copyWith(
                color: lableColor ?? Theme.of(context).backgroundColor),
          ),
        ));
  }
}
