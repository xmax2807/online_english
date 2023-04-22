import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/course_repository.dart';
import 'dio_provider.dart';

final courseRepositoryProvider =
    Provider((ref) => CourseRepository(ref.read(dioProvider)));
