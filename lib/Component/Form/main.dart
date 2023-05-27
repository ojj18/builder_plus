import 'package:flutter/material.dart';
import '/Common/constant.dart';

class CommonFormField extends StatelessWidget {
  const CommonFormField(
      {this.labelText = "",
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
      super.key});
  final String? labelText;
  final String? hintText;
  final String? initialText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconEvent;
  final Function? onError;
  final Function? onSave;
  final Function? onChanged;
  final TextEditingController? textController;
  final FocusNode? currentFocusNode;
  final bool obscureText;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final TextAlign? textAlign;

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
            style: const TextStyle(
                color: Colors.black,
                fontSize: fontSize16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: hintText,
              labelStyle: LightTheme.header2,
              counter: const SizedBox.shrink(),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.redAccent,
                ),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            cursorColor: Colors.deepPurpleAccent,
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
