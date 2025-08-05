import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/data/schedule_repository.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/presentation/schedule_list.dart';

class ScheduleListPage extends ConsumerWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(scheduleListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Schedules')),
      body: schedulesAsync.when(
        data: (schedules) =>
            ScheduleList(isUpcomingSchedule: false, schedules: schedules),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
