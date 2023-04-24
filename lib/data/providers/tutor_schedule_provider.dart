import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/tutor_table_schedules.dart';
import 'dio_provider.dart';

final tutorTableScheduleProvider =
    Provider((ref) => TutorTableScheduleRepository(ref.read(dioProvider)));
