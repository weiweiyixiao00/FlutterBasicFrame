class MemberInfo {
  String memberName;
  String memberId;
  String memberPhone;
  String createDate;
  String remark;
  String birthday;
  String address;
  int balance;

  MemberInfo({
    this.memberName,
    this.memberId,
    this.memberPhone,
    this.createDate,
    this.remark,
    this.birthday,
    this.address,
    this.balance
  });

  MemberInfo.fromJson(Map<String, dynamic> json) {
    memberName = json['memberName'];
    memberId = json['memberId'];
    memberPhone = json['memberPhone'];
    createDate = json['createDate'];
    remark = json['remark'];
    birthday = json['birthday'];
    address = json['address'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberName'] = this.memberName;
    data['memberId'] = this.memberId;
    data['memberPhone'] = this.memberPhone;
    data['createDate'] = this.createDate;
    data['remark'] = this.remark;
    data['birthday'] = this.birthday;
    data['address'] = this.address;
    data['balance'] = this.balance;
    return data;
  }
}
