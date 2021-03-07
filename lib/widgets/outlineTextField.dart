import 'package:amr_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class OutLinedTextField extends StatefulWidget {
  final ValueSetter<String> onChanged;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool hasError;
  final String errorLabel;
  final String prefix;

  const OutLinedTextField({
    Key key,
    this.onChanged,
    this.label,
    this.obscureText = false,
    this.keyboardType,
    this.hasError = false,
    this.errorLabel = 'This is an error',
    this.prefix,
  }) : super(key: key);

  @override
  _OutLinedTextFieldState createState() => _OutLinedTextFieldState();
}

class _OutLinedTextFieldState extends State<OutLinedTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: TEXT_COLOR, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: widget.keyboardType,
                      obscureText: _obscureText,
                      onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        labelText: widget.label,
                        labelStyle: TextStyle(
                          color: TEXT_COLOR.withOpacity(0.5),
                        ),
                        prefixText: widget.prefix,
                        prefixStyle: TextStyle(
                          fontSize: 17,
                          color: TEXT_COLOR.withOpacity(0.5),
                        ),
                      ),
                      style: TextStyle(
                        color: TEXT_COLOR,
                        fontSize: 17,
                      ),
                      cursorColor: TEXT_COLOR,
                    ),
                  ),
                  widget.obscureText
                      ? TouchableOpacity(
                          child: Icon(
                            !_obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: TEXT_COLOR,
                          ),
                          activeOpacity: 0.4,
                          onTap: _toggle,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          if (widget.hasError)
            Container(
              margin: EdgeInsets.only(left: 2.0, right: 2),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).errorColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(5))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.errorLabel,
                  style: TextStyle(
                      color: TEXT_COLOR,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
        ],
      );
}
