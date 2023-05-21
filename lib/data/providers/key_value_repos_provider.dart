import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/key_value_repository.dart';
import 'dio_provider.dart';

final keyValueRepositoryProvider =
    Provider((ref) => BaseKeyValueRepository(ref.read(dioProvider)));
