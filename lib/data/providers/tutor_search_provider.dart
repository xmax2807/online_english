import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/repositories/tutor_search_repository.dart';

import 'dio_provider.dart';

final tutorSearchProvider =
    Provider((ref) => TutorSearchRepository(ref.read(dioProvider)));
