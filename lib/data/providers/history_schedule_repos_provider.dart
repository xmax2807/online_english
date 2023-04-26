import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/history_schedule_repository.dart';
import 'dio_provider.dart';

final historyScheduleReposProvider =
    Provider((ref) => HistoryScheduleRepository(ref.read(dioProvider)));
