import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/data/schedule_repository.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/scheduling/domain/schedule.dart';

final _createClassKey = GlobalKey<FormBuilderState>();
List<String> classOptions = ['Individual', 'Group'];
List<String> categoryOptions = ['Seminar', 'Workshop'];
List<String> durationOptions = ['55 minutes', '1 hour', '2 hours'];
List<String> repeatOptions = ['None', 'Everyday'];
List<String> locationOptions = ['Studio A', 'Studio B'];

class ScheduleForm extends ConsumerWidget {
  const ScheduleForm({super.key});

  final double _minWidth = 400.0;
  final double _spacing = 120.0;
  final double _runSpacing = 10.0;
  final String formTitle = 'Create New Schedule';

  void cancelForm() {
    debugPrint('Form cancelled');
  }

  Future<void> submitForm(WidgetRef ref) async {
    if (_createClassKey.currentState?.saveAndValidate() ?? false) {
      final formData = _createClassKey.currentState!.value;

      final ScheduleModel newSchedule = ScheduleModel(
        DateTime.now(),
        id: '',
        businessId: 'stretch-n-flow',
        title: formData['Title'],
        instructorId: 'admin456', // Or derive dynamically
        date: (formData['Date'] as DateTimeRange).start,
        time: (formData['Time'] as DateTime),
        duration: _parseDuration(formData['Duration']).toString(),
        location: formData['Location'],
        maxAttendees: int.parse(formData['Max Attendees']),
        classType: formData['ClassType'],
        description: '',
        category: '',
        tags: '',
        repeat: '',
      );

      try {
        await ref.read(scheduleServiceProvider).create(newSchedule);
        debugPrint('✅ Schedule created!');
      } catch (e) {
        debugPrint('❌ Error: $e');
      }
    } else {
      debugPrint('❗Form validation failed');
    }
  }

  static int _parseDuration(String value) {
    if (value.contains('55')) return 55;
    if (value.contains('hour')) return 60;
    if (value.contains('2 hours')) return 120;
    return 55;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Create New Schedule'))),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormBuilder(
                  key: _createClassKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: _runSpacing,
                          spacing: _spacing,
                          children: [
                            // your form fields...
                            // (no changes here)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: _runSpacing,
                          spacing: _spacing,
                          children: [
                            SizedBox(
                              width: _minWidth,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_minWidth, 60),
                                  backgroundColor: AppColors.whiteSmoke,
                                  foregroundColor: AppColors.violetE3,
                                ),
                                onPressed: () => cancelForm(),
                                child: const Text('Cancel'),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_minWidth, 60),
                                  backgroundColor: AppColors.violetE3,
                                  foregroundColor: AppColors.white,
                                ),
                                onPressed: () => submitForm(ref),
                                child: const Text('Create Schedule'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
