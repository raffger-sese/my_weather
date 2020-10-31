import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';

class AppCustomtextField extends StatefulWidget {
  final FormFieldValidator<String> validator;
  final void Function(String) onTextChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final bool obscureText;
  final Color fillColor;
  final IconData icon;
  final TextStyle textStyle;

  AppCustomtextField(
      {this.validator,
      this.onTextChanged,
      @required this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.hintText,
      this.obscureText = false,
      this.fillColor,
      this.icon,
      this.textStyle});

  @override
  _AppCustomtextFieldState createState() => _AppCustomtextFieldState();
}

class _AppCustomtextFieldState extends State<AppCustomtextField> {
  @override
  void initState() {
    super.initState();
    if (widget.onTextChanged != null) {
      widget.controller.addListener(_onTextChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.fillColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.instance.borderRadius),
        ),
        child: Row(
          children: [
            widget.icon != null
                ? Container(
                    width: 45, height: 45, child: Icon(widget.icon, size: 20.0))
                : Container(width: 16),
            Expanded(
              child: TextFormField(
                style: widget.textStyle != null
                    ? widget.textStyle
                    : AppTheme.instance.text,
                obscureText: widget.obscureText,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                controller: widget.controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 16, bottom: 16),
                    filled: true,
                    hintText: widget.hintText,
                    hintStyle: AppTheme.instance.textHint,
                    fillColor: Colors.transparent,
                    border: InputBorder.none),
              ),
            ),
          ],
        ));
  }

  void _onTextChanged() {
    widget.onTextChanged(widget.controller.text);
  }
}
