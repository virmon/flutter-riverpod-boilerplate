import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/block.dart';

class Booking {
  String? bookingId;
  String? blockId;
  String? title;
  String? startTime;
  String? status;
  Block? block;

  Booking({
    this.bookingId,
    this.blockId,
    this.title,
    this.startTime,
    this.status,
    this.block,
  });

  Booking copyWith({
    String? bookingId,
    String? blockId,
    String? title,
    String? startTime,
    String? status,
    Block? block,
  }) => Booking(
    bookingId: bookingId ?? this.bookingId,
    blockId: blockId ?? this.blockId,
    title: title ?? this.title,
    startTime: startTime ?? this.startTime,
    status: status ?? this.status,
    block: block ?? this.block,
  );
}
