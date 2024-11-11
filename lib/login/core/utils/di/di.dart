import 'package:flutter_login/login/core/utils/session/user_session.dart';
import 'package:flutter_login/login/data/datasource/login_datasource.dart';
import 'package:flutter_login/login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_login/login/domain/repositories/auth_repository.dart';
import 'package:flutter_login/login/presentation/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class DIHelper {
  //singleton
  static final DIHelper singleton = DIHelper._internal();

  factory DIHelper() {
    return singleton;
  }

  DIHelper._internal();

  List<SingleChildWidget> dataProviders = [
    //***** Core ******** */
    Provider<UserSession>(
      create: (_) => UserSession(),
    ),

    //***** Login ******** */
    Provider<LoginDatasource>(
      create: (_) => LoginDatasourceImpl(),
    ),

    Provider<AuthRepository>(
      create: (_) => AuthRepositoryImpl(
        _.read<LoginDatasource>(),
      ),
    ),

    Provider<LoginController>(
      create: (_) => LoginController(
        _.read<AuthRepository>(),
      ),
    ),
  ];
}
