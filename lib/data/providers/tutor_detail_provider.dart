import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/tutor_info_repository.dart';
import 'dio_provider.dart';

final tutorInfoProvider =
    Provider((ref) => TutorInfoRepository(ref.read(dioProvider)));
