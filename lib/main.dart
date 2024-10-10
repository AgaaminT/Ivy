import 'package:flutter/material.dart';
import 'package:ivy/app.dart';

import 'package:ivy/providers/email_auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmailAuthProvider()),
      ],
      child: const App(),
    ),
  );
}
