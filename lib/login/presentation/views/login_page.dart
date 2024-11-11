import 'package:flutter/material.dart';
import 'package:flutter_login/login/core/utils/di/di.dart';
import 'package:provider/provider.dart';

import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DIHelper.singleton.dataProviders,
      child: const LoginView(),
    );
  }
}
