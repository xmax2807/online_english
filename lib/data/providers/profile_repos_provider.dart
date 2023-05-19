import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/profile_repository.dart';
import 'dio_provider.dart';

final profileReposProvider =
    Provider((ref) => ProfileRepository(ref.read(dioProvider)));
