import 'package:flutter/material.dart';

import '../../Common/constant.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      this.buttonText = "",
      this.onButtonTap,
      this.isBorderEnable = false,
      this.radius = 8,
      this.height = 50,
      this.width = 50,
      this.buttonTextColor = Colors.white,
      this.buttonIcon,
      this.iconColor = Colors.black,
      this.elevation = 0.0,
      this.iconSize,
      this.gapWidth = 10,
      this.backgroundColor = primaryColor,
      this.fontSize = fontSize12,
      this.fontfamily
      });

  final String? buttonText;
  final VoidCallback? onButtonTap;
  final bool isBorderEnable;
  final double radius;
  final double height;
  final double width;
  final Color buttonTextColor;
  final IconData? buttonIcon;
  final Color iconColor;
  final double elevation;
  final double? iconSize;
  final double? gapWidth;
  final Color? backgroundColor;
  final double? fontSize;
  final String? fontfamily;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: InkWell(
        onTap: onButtonTap,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonIcon != null
                    ? Icon(
                        buttonIcon,
                        color: iconColor,
                        size: iconSize,
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  width: gapWidth,
                ),
                buttonText != ""
                    ? Text(
                        buttonText!,
                        style: TextStyle(
                            color: buttonTextColor,
                            fontFamily: fontfamily,
                            fontSize: fontSize,

                            fontWeight: FontWeight.w500),
                      )
                    : const SizedBox.shrink()
              ],
            )),
      ),
    );
  }
}
