import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/providers/dio_provider.dart';
import 'package:online_english/data/repositories/auth_repository.dart';

final authReposProvider =
    Provider((ref) => AuthRepository(ref.read(dioProvider)));
