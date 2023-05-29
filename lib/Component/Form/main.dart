import 'package:flutter/material.dart';
import '/Common/constant.dart';

class CommonFormField extends StatelessWidget {
  const CommonFormField(
      {this.floatingLabelBehavior,
      this.labelText = "",
      this.initialText,
      this.currentFocusNode,
      this.textController,
      this.hintText,
      this.onChanged,
      this.onError,
      this.onSave,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconEvent,
      this.obscureText = false,
      this.height = 50,
      this.width,
      this.keyboardType,
      this.maxLength = 50,
      this.maxLines = 5,
      this.textAlign = TextAlign.start,
      this.readOnly = false,
      this.onTap,
      super.key});
  final String? labelText;
  final String? hintText;
  final String? initialText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? suffixIconEvent;
  final Function? onError;
  final Function? onSave;
  final Function? onChanged;
  final Function? onTap;
  final TextEditingController? textController;
  final FocusNode? currentFocusNode;
  final bool obscureText;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final TextAlign? textAlign;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width ?? MediaQuery.of(context).size.width,
          child: TextFormField(
            textAlign: textAlign!,
            onTap: () {
              if (onTap != null) onTap!();
            },
            readOnly: readOnly,
            style: const TextStyle(
                color: Colors.black,
                fontSize: fontSize16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.all(10.0),
              labelText: labelText,
              labelStyle: LightTheme.subHeader7,
              floatingLabelBehavior: floatingLabelBehavior,
              counter: const SizedBox.shrink(),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.redAccent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: textFieldBorderColor,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: textFieldBorderColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: textFieldBorderColor,
                ),
              ),
            ),
            cursorColor: Colors.black,
            obscureText: obscureText,
            initialValue: initialText,
            controller: textController,
            focusNode: currentFocusNode,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxLines,
            onSaved: (value) {
              if (onSave != null) onSave!(value);
            },
            onChanged: (value) {
              if (onChanged != null) onChanged!(value);
            },
            validator: (value) {
              if (onError != null) return onError!(value);
              return null;
            },
          ),
        ),
      ],
    );
  }
}
