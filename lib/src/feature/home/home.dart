import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final _createClassKey = GlobalKey<FormBuilderState>();
List<String> classOptions = ['Individual', 'Group'];
List<String> categoryOptions = ['Seminar', 'Workshop'];
List<String> durationOptions = ['55 minutes', '1 hour', '2 hours'];
List<String> repeatOptions = ['None', 'Everyday'];
List<String> locationOptions = ['Studio A', 'Studio B'];

class Home extends StatelessWidget {
  const Home({super.key});

  final double _minWidth = 400.0;
  final double _spacing = 120.0;
  final double _runSpacing = 10.0;
  final String formTitle = 'Create New Schedule';

  void cancelForm() {
    debugPrint('Form cancelled');
  }

  void submitForm() {
    debugPrint('Form submit');
    _createClassKey.currentState?.saveAndValidate();
    debugPrint(_createClassKey.currentState?.value.toString());

    // can access all field values without saving form with instantValues
    _createClassKey.currentState?.validate();
    debugPrint(_createClassKey.currentState?.instantValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Forms'))),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          // width: MediaQuery.of(context).size.width * 0.7,
          // margin: EdgeInsets.all(16.0),
          // decoration: BoxDecoration(
          //   color: AppColors.whiteSmoke,
          //   border: Border.all(color: AppColors.grey),
          //   borderRadius: BorderRadius.circular(10.0), // Rounded corners
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withValues(alpha: 0.5),
          //       spreadRadius: 2,
          //       blurRadius: 7,
          //       offset: Offset(0, 3), // changes position of shadow
          //     ),
          //   ],
          // ),
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
                        padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                        child: Text(
                          formTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: _runSpacing,
                          spacing: _spacing,
                          children: [
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Title',
                                decoration: const InputDecoration(
                                  labelText: 'Title',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Class Type',
                                initialValue: 'Individual',
                                decoration: InputDecoration(
                                  labelText: 'Class Type',
                                  hintText: 'Class Type',
                                  border: OutlineInputBorder(),
                                ),
                                items: classOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'description',
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(200),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Category',
                                initialValue: 'Workshop',
                                decoration: InputDecoration(
                                  labelText: 'Category',
                                  hintText: 'Category',
                                  border: OutlineInputBorder(),
                                ),
                                items: categoryOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Tags',
                                decoration: const InputDecoration(
                                  labelText: 'Tags',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDateRangePicker(
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2110),
                                name: 'Date',
                                decoration: const InputDecoration(
                                  labelText: 'Date',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDateTimePicker(
                                name: 'Time',
                                decoration: const InputDecoration(
                                  labelText: 'Time',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Duration',
                                initialValue: '55 minutes',
                                decoration: InputDecoration(
                                  labelText: 'Duration',
                                  hintText: 'Duration',
                                  border: OutlineInputBorder(),
                                ),
                                items: durationOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Repeat',
                                initialValue: 'None',
                                decoration: InputDecoration(
                                  labelText: 'Repeat',
                                  hintText: 'Repeat',
                                  border: OutlineInputBorder(),
                                ),
                                items: repeatOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Location',
                                initialValue: 'Studio A',
                                decoration: InputDecoration(
                                  labelText: 'Location',
                                  hintText: 'Location',
                                  border: OutlineInputBorder(),
                                ),
                                items: locationOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            // SizedBox(width: _minWidth, height: 0),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                name: 'Max Attendees',
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: const InputDecoration(
                                  labelText: 'Max Attendees',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.min(1),
                                  FormBuilderValidators.max(200),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: AppColors.violetE3),
                                  ),
                                  backgroundColor: AppColors.whiteSmoke,
                                  foregroundColor: AppColors.violetE3,
                                ),
                                onPressed: () => cancelForm(),
                                child: Text('Cancel'),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_minWidth, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: AppColors.violetE3,
                                  foregroundColor: AppColors.white,
                                ),
                                onPressed: () => submitForm(),
                                child: Text('Create Schedule'),
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
