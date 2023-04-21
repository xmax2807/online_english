import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';
import 'package:online_english/data/repositories/auth_repository.dart';

import '../data/providers/auth_repos_provider.dart';

final authServiceProvider = ChangeNotifierProvider.autoDispose(
    (ref) => AuthenicationService(ref.read(authReposProvider)));

class AuthenicationService extends ChangeNotifier {
  final AuthRepository _repository;
  UserModel? _user;
  UserModel? get user => _user;
  AuthenicationService(this._repository);

  bool get isAuthenicated => _user != null;

  Future signInWithEmailAndPassword(String email, String password) {
    return _repository
        .signInWithEmailAndPassword(email, password)
        .then((result) {
      if (result != null) {
        _user = result;
      }
    });
  }

  Future signUp(String email, String password) {
    return _repository.signUp(email, password).then((result) {
      if (result != null) {
        _user = result;
      }
    });
  }
}
