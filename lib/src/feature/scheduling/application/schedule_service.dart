import '../domain/schedule.dart';
import '../data/schedule_repository.dart';

class ScheduleService {
  final ScheduleRepository repository;

  ScheduleService(this.repository);

  Future<void> create(ScheduleModel model) => repository.createSchedule(model);

  Stream<List<ScheduleModel>> list() => repository.getSchedules();
}
