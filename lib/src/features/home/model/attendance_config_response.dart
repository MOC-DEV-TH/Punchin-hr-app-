import 'dart:convert';

AttendanceConfigResponse responseFromJson(String str) => AttendanceConfigResponse.fromJson(json.decode(str));

String responseToJson(AttendanceConfigResponse data) => json.encode(data.toJson());

class AttendanceConfigResponse {
  int? statusCode;
  String? message;
  Data? data;

  AttendanceConfigResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory AttendanceConfigResponse.fromJson(Map<String, dynamic> json) => AttendanceConfigResponse(
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? checkInTimezone;
  bool? allowMultipleCheckInsPerWorkingDay;
  List<AttendanceType>? attendanceTypes;
  List<AttendanceOffice>? attendanceOffices;

  Data({
    this.checkInTimezone,
    this.allowMultipleCheckInsPerWorkingDay,
    this.attendanceTypes,
    this.attendanceOffices,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    checkInTimezone: json["check_in_timezone"],
    allowMultipleCheckInsPerWorkingDay: json["allow_multiple_check_ins_per_working_day"],
    attendanceTypes: json["attendance_types"] == null ? [] : List<AttendanceType>.from(json["attendance_types"]!.map((x) => AttendanceType.fromJson(x))),
    attendanceOffices: json["attendance_offices"] == null ? [] : List<AttendanceOffice>.from(json["attendance_offices"]!.map((x) => AttendanceOffice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "check_in_timezone": checkInTimezone,
    "allow_multiple_check_ins_per_working_day": allowMultipleCheckInsPerWorkingDay,
    "attendance_types": attendanceTypes == null ? [] : List<dynamic>.from(attendanceTypes!.map((x) => x.toJson())),
    "attendance_offices": attendanceOffices == null ? [] : List<dynamic>.from(attendanceOffices!.map((x) => x.toJson())),
  };
}

class AttendanceOffice {
  int? id;
  String? name;
  String? timezone;
  double? lat;
  double? long;
  double? allowClockInRange;
  double? allowClockOutRange;
  List<Schedule>? schedules;

  AttendanceOffice({
    this.id,
    this.name,
    this.timezone,
    this.lat,
    this.long,
    this.allowClockInRange,
    this.allowClockOutRange,
    this.schedules,
  });

  factory AttendanceOffice.fromJson(Map<String, dynamic> json) => AttendanceOffice(
    id: json["id"],
    name: json["name"],
    timezone: json["timezone"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    allowClockInRange: json["allow_clock_in_range"],
    allowClockOutRange: json["allow_clock_out_range"],
    schedules: json["schedules"] == null ? [] : List<Schedule>.from(json["schedules"]!.map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "timezone": timezone,
    "lat": lat,
    "long": long,
    "allow_clock_in_range": allowClockInRange,
    "allow_clock_out_range": allowClockOutRange,
    "schedules": schedules == null ? [] : List<dynamic>.from(schedules!.map((x) => x.toJson())),
  };
}

class Schedule {
  int? assignmentId;
  int? id;
  String? name;
  List<int>? workingDays;
  String? startTime;
  String? endTime;
  int? endDayOffset;
  int? graceMinutes;
  DateTime? effectiveFrom;
  dynamic effectiveTo;
  DateTime? scheduleEffectiveFrom;
  dynamic scheduleEffectiveTo;

  Schedule({
    this.assignmentId,
    this.id,
    this.name,
    this.workingDays,
    this.startTime,
    this.endTime,
    this.endDayOffset,
    this.graceMinutes,
    this.effectiveFrom,
    this.effectiveTo,
    this.scheduleEffectiveFrom,
    this.scheduleEffectiveTo,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    assignmentId: json["assignment_id"],
    id: json["id"],
    name: json["name"],
    workingDays: json["working_days"] == null ? [] : List<int>.from(json["working_days"]!.map((x) => x)),
    startTime: json["start_time"],
    endTime: json["end_time"],
    endDayOffset: json["end_day_offset"],
    graceMinutes: json["grace_minutes"],
    effectiveFrom: json["effective_from"] == null ? null : DateTime.parse(json["effective_from"]),
    effectiveTo: json["effective_to"],
    scheduleEffectiveFrom: json["schedule_effective_from"] == null ? null : DateTime.parse(json["schedule_effective_from"]),
    scheduleEffectiveTo: json["schedule_effective_to"],
  );

  Map<String, dynamic> toJson() => {
    "assignment_id": assignmentId,
    "id": id,
    "name": name,
    "working_days": workingDays == null ? [] : List<dynamic>.from(workingDays!.map((x) => x)),
    "start_time": startTime,
    "end_time": endTime,
    "end_day_offset": endDayOffset,
    "grace_minutes": graceMinutes,
    "effective_from": effectiveFrom == null ? null : "${effectiveFrom!.year.toString().padLeft(4, '0')}-${effectiveFrom!.month.toString().padLeft(2, '0')}-${effectiveFrom!.day.toString().padLeft(2, '0')}",
    "effective_to": effectiveTo,
    "schedule_effective_from": scheduleEffectiveFrom == null ? null : "${scheduleEffectiveFrom!.year.toString().padLeft(4, '0')}-${scheduleEffectiveFrom!.month.toString().padLeft(2, '0')}-${scheduleEffectiveFrom!.day.toString().padLeft(2, '0')}",
    "schedule_effective_to": scheduleEffectiveTo,
  };
}

class AttendanceType {
  String? value;
  String? label;
  bool? requiresLocation;
  bool? requiresSchedule;

  AttendanceType({
    this.value,
    this.label,
    this.requiresLocation,
    this.requiresSchedule,
  });

  factory AttendanceType.fromJson(Map<String, dynamic> json) => AttendanceType(
    value: json["value"],
    label: json["label"],
    requiresLocation: json["requires_location"],
    requiresSchedule: json["requires_schedule"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
    "requires_location": requiresLocation,
    "requires_schedule": requiresSchedule,
  };
}
