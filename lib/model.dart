class ListRegister {
  String? personId;
  String? code;
  String? name;
  String? nickname;
  String? nameT;
  String? lNameT;
  String? nameE;
  String? lNameE;
  String? nicknameE;
  String? flagwork;
  String? position;
  String? prefix;
  String? startwork;
  String? pOSICODE;
  String? sectionCode;
  String? serviceName;
  String? company;
  String? doctime;
  String? doctime1;
  String? deptname;

  ListRegister(
      {this.personId,
      this.code,
      this.name,
      this.nickname,
      this.nameT,
      this.lNameT,
      this.nameE,
      this.lNameE,
      this.nicknameE,
      this.flagwork,
      this.position,
      this.prefix,
      this.startwork,
      this.pOSICODE,
      this.sectionCode,
      this.serviceName,
      this.company,
      this.doctime,
      this.doctime1,
      this.deptname});

  ListRegister.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    code = json['code'];
    name = json['name'];
    nickname = json['nickname'];
    nameT = json['Name_T'];
    lNameT = json['LName_T'];
    nameE = json['Name_E'];
    lNameE = json['LName_E'];
    nicknameE = json['Nickname_E'];
    flagwork = json['Flagwork'];
    position = json['Position'];
    prefix = json['Prefix'];
    startwork = json['Startwork'];
    pOSICODE = json['POSI_CODE'];
    sectionCode = json['section_code'];
    serviceName = json['Service_Name'];
    company = json['company'];
    doctime = json['doctime'];
    doctime1 = json['doctime1'];
    deptname = json['deptname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['Name_T'] = this.nameT;
    data['LName_T'] = this.lNameT;
    data['Name_E'] = this.nameE;
    data['LName_E'] = this.lNameE;
    data['Nickname_E'] = this.nicknameE;
    data['Flagwork'] = this.flagwork;
    data['Position'] = this.position;
    data['Prefix'] = this.prefix;
    data['Startwork'] = this.startwork;
    data['POSI_CODE'] = this.pOSICODE;
    data['section_code'] = this.sectionCode;
    data['Service_Name'] = this.serviceName;
    data['company'] = this.company;
    data['doctime'] = this.doctime;
    data['doctime1'] = this.doctime1;
    data['deptname'] = this.deptname;
    return data;
  }

  static List<ListRegister>? fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => ListRegister.fromJson(item)).toList();
  }
}
