import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/booking.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/membership.dart';

class AppUser {
  String? uid;
  String? email;
  String? name;
  String? createdAt;
  String? profilePic;
  String? lastBusinessId;
  String? platformRole;
  bool? notifications;
  List<Membership>? memberships;
  List<Booking>? bookings;

  AppUser({
    this.uid,
    this.email,
    this.name,
    this.createdAt,
    this.profilePic,
    this.lastBusinessId,
    this.platformRole,
    this.notifications,
    this.memberships,
    this.bookings,
  });

  AppUser copyWith({
    String? uid,
    String? email,
    String? name,
    String? createdAt,
    String? profilePic,
    String? lastBusinessId,
    String? platformRole,
    bool? notifications,
    List<Booking>? bookings,
    List<Membership>? memberships,
  }) => AppUser(
    uid: uid ?? this.uid,
    email: email ?? this.email,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    profilePic: profilePic ?? this.profilePic,
    lastBusinessId: lastBusinessId ?? this.lastBusinessId,
    platformRole: platformRole ?? this.platformRole,
    notifications: notifications ?? this.notifications,
    memberships: memberships ?? this.memberships,
    bookings: bookings ?? this.bookings,
  );
}
