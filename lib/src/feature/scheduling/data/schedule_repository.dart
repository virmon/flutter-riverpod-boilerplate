import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/application/schedule_service.dart';
import '../domain/schedule.dart';

class ScheduleRepository {
  final FirebaseFirestore firestore;

  ScheduleRepository(this.firestore);

  Future<void> createSchedule(ScheduleModel schedule) {
    return firestore.collection('classes').add(schedule.toJson());
  }

  Stream<List<ScheduleModel>> getSchedules() {
    return firestore.collection('classes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ScheduleModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> deleteSchedule(String id) {
    return firestore.collection('classes').doc(id).delete();
  }
}

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final scheduleRepoProvider = Provider(
  (ref) => ScheduleRepository(ref.watch(firestoreProvider)),
);

final scheduleServiceProvider = Provider(
  (ref) => ScheduleService(ref.watch(scheduleRepoProvider)),
);

final scheduleListProvider = StreamProvider(
  (ref) => ref.watch(scheduleServiceProvider).list(),
);
