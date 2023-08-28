class ReadData {
  double? studentGpa;
  String? studentId;
  String? studentName;
  String? studyProgramId;
  String? sid;

  ReadData({
    this.studentGpa,
    this.studentId,
    this.studentName,
    this.studyProgramId,
    this.sid,
  });

  ReadData.fromJson(Map<String, dynamic> json) {
    studentGpa = json['studentGpa'];
    studentId = json['studentId'];
    studentName = json['studentName'];
    studyProgramId = json['studyProgramId'];
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentGpa'] = this.studentGpa;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['studyProgramId'] = this.studyProgramId;
    data['sid'] = this.sid;
    return data;
  }
}
