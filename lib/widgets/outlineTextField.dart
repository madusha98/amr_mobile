import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class OutLinedTextField extends StatefulWidget {
  final ValueSetter<String> onChanged;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool hasError;
  final String errorLabel;

  const OutLinedTextField(
      {Key key,
      this.onChanged,
      this.label,
      this.obscureText = false,
      this.keyboardType,
      this.hasError = false,
      this.errorLabel = 'This is an error'})
      : super(key: key);

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
              border: Border.all(color: Colors.white, width: 1.5),
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
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  widget.obscureText
                      ? TouchableOpacity(
                          child: Icon(
                            !_obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white,
                          ),
                          activeOpacity: 0.4,
                          onTap: _toggle,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          if (widget.hasError)Container(
            margin: EdgeInsets.only(left:8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.errorLabel,
                style: TextStyle(
                    backgroundColor: Color.fromRGBO(163, 0, 0, 1),
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      );
}
