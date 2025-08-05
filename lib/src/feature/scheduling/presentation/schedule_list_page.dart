import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/data/schedule_repository.dart';

class ScheduleListPage extends ConsumerWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(scheduleListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Schedules')),
      body: schedulesAsync.when(
        data: (schedules) => ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            final schedule = schedules[index];
            return ListTile(
              title: Text(schedule.title),
              subtitle: Text('${schedule.date} at ${schedule.time}'),
              trailing: Text(schedule.location),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
