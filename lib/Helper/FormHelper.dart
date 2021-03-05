import 'package:DealerPortalApp/Component/ColorCode.dart';
import 'package:flutter/material.dart';

class TextFormFieldHelper extends StatelessWidget {
  const TextFormFieldHelper({
    this.readOnly,
    this.initialValue,
    // this.controller,
    this.textVal,
    this.keyboardType,
    this.regExpPattern,
    this.labelText,
    this.onChanged,
    this.onSaved,
    this.icon,
    this.minLine,
    this.maxLen,
    this.focus,
    this.unfocus,
    this.textInputAction,
  });
  final bool readOnly;
  final String initialValue;
  // final TextEditingController controller;
  final String textVal;
  final TextInputType keyboardType;
  final String regExpPattern;
  final String labelText;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final IconData icon;
  final int minLine;
  final int maxLen;
  final Function focus;
  final Function(String) unfocus;
  final TextInputAction textInputAction;

  build(BuildContext context) {
    return TextFormField(
      readOnly: false,
      initialValue: initialValue,
      // focusNode: FocusNode(),
      keyboardType: keyboardType,
      maxLines: minLine,
      maxLength: maxLen,
      // controller: controller,
      validator: (String value) {
        String pattern = regExpPattern ?? r'';
        RegExp regExp = new RegExp(pattern);
        if (value.length == 0) {
          return "Required";
        } else if (!regExp.hasMatch(value)) {
          return "Must verify pattern";
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      // onEditingComplete: focus,
      // onFieldSubmitted: unfocus,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusColor: Colors.lightBlue,
        border: OutlineInputBorder(),
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 16.0,
            color: ColorCode.BlackTextColorCode,
            fontWeight: FontWeight.w300),
        prefixIcon: Icon(icon),
      ),
    );
  }
}

class InputDatePickerFormFieldHelper extends StatelessWidget {
  const InputDatePickerFormFieldHelper({
    this.readOnly,
    this.controller,
    this.keyboardType,
    this.regExpPattern,
    this.labelText,
    this.icon,
    this.minLine,
    this.maxLen,
    this.focus,
    this.unfocus,
    this.textInputAction,
  });
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String regExpPattern;
  final String labelText;
  final IconData icon;
  final int minLine;
  final int maxLen;
  final Function focus;
  final Function(String) unfocus;
  final TextInputAction textInputAction;

  build(BuildContext context) {
    return InputDatePickerFormField(
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, DateTime.now().month - 1),
      lastDate: DateTime.now(),
    );
  }
}

// Widget textFormFeild(
//         {String title,
//         bool readOnly,
//         String Function(String) validate,
//         @required TextEditingController controller,
//         void Function(String) onSaved,
//         void Function(String) onChanged}) {
//       return new TextFormField(
//         // focusNode: FocusNode(),
//         readOnly: readOnly,
//         controller: controller,
//         validator: validate,
//         onSaved: onSaved,
//         onChanged: onChanged,
//         // onSaved: (String val) {
//         //   Title = val;
//         // },
//         decoration: new InputDecoration(
//           border: new OutlineInputBorder(),
//           hintText: title ?? 'Enter any detail',
//           hintStyle:
//               TextStyle(fontSize: 12.0, color: ColorCode.BlackTextColorCode),
//           //helperText: 'Keep it short, this is just a demo.',
//           labelText: 'Enter any detail',
//           labelStyle: new TextStyle(
//               fontSize: 14.0,
//               color: ColorCode.BlackTextColorCode,
//               fontWeight: FontWeight.w300),
//           prefixIcon: const Icon(
//             FontAwesomeIcons.briefcase,
//             size: 15.0,
//             color: Color(0xFFCEA910),
//           ),
//           prefixText: ' ',
//           //suffixText: 'USD',
//           //suffixStyle: const TextStyle(color: Colors.green)
//         ),
//       );
//     }
