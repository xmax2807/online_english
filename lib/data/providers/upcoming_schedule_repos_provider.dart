import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/upcoming_schedule_repository.dart';
import 'dio_provider.dart';

final upcomingScheduleReposProvider =
    Provider((ref) => UpcomingScheduleRepository(ref.read(dioProvider)));
