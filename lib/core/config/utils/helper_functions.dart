import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<Object?> pushPage(BuildContext context, String route, {dynamic extra}) async {
  return await GoRouter.of(context).push(route, extra: extra);
}