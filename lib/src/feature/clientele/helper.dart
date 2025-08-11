DateTime getMondayOfCurrentWeek() {
  DateTime now = DateTime.now();
  int daysToSubtract = now.weekday - DateTime.monday;
  DateTime mondayOfCurrentWeek = DateTime.now().subtract(
    Duration(days: daysToSubtract),
  );
  return mondayOfCurrentWeek;
}
