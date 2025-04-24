import 'package:flutter/material.dart';

/// Represents the different possible input types
/// (Mapping them to Flutter's best equivalents)
enum InputType {
  NUMBER(
    TextInputType.numberWithOptions(signed: true, decimal: true),
    TextInputAction.go,
  ),
  NUMBER_ONLY(
    TextInputType.numberWithOptions(signed: false, decimal: false),
    TextInputAction.go,
  ),
  PASSWORD( // Added password type
    TextInputType.visiblePassword,
    TextInputAction.done,
  ),
  SEARCH(TextInputType.text, TextInputAction.search),
  TEXT(TextInputType.text, TextInputAction.newline),
  URL(TextInputType.url, TextInputAction.next),
  EMAIL(TextInputType.emailAddress, TextInputAction.go),
  TELEPHONE(TextInputType.phone, TextInputAction.emergencyCall);

  final TextInputType inputType;
  final TextInputAction inputAction;

  const InputType(this.inputType, this.inputAction);
}
