import 'package:flutter/material.dart';

void navigate({
  required BuildContext context,
  required String routeName,
  dynamic arguments,
}) {
  Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
}
