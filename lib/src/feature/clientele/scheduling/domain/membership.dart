import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/booking.dart';

class MembershipId {
  String? membershipId;

  MembershipId({this.membershipId});

  MembershipId copyWith({String? membershipId}) =>
      MembershipId(membershipId: membershipId ?? this.membershipId);
}

class Membership {
  String? membershipId;
  String? businessId;
  String? offerId;
  String? name;
  int? credits;
  int? creditsUsed;
  String? expiration;
  String? status;
  String? createdAt;
  List<Booking>? bookings;

  Membership({
    this.membershipId,
    this.businessId,
    this.offerId,
    this.name,
    this.credits,
    this.creditsUsed,
    this.expiration,
    this.status,
    this.createdAt,
    this.bookings,
  });

  Membership copyWith({
    String? membershipId,
    String? businessId,
    String? offerId,
    String? name,
    int? credits,
    int? creditsUsed,
    String? expiration,
    String? status,
    String? createdAt,
    List<Booking>? bookings,
  }) => Membership(
    membershipId: membershipId ?? this.membershipId,
    businessId: businessId ?? this.businessId,
    offerId: offerId ?? this.offerId,
    name: name ?? this.name,
    credits: credits ?? this.credits,
    creditsUsed: creditsUsed ?? this.creditsUsed,
    expiration: expiration ?? this.expiration,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    bookings: bookings ?? this.bookings,
  );
}

class BusinessId {
  String? businessId;

  BusinessId({this.businessId});

  BusinessId copyWith({String? businessId}) =>
      BusinessId(businessId: businessId ?? this.businessId);
}

class OfferId {
  String? offerId;

  OfferId({this.offerId});

  OfferId copyWith({String? offerId}) =>
      OfferId(offerId: offerId ?? this.offerId);
}
