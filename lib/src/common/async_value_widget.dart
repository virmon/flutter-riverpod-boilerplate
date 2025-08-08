import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/common/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.disabledLoading = false,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool disabledLoading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => Center(
        heightFactor: 2,
        child: disabledLoading ? null : CircularProgressIndicator(),
      ),
    );
  }
}
