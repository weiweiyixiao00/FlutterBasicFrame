class RecordInfo {
  String memberId;
  String createDate;
  String remark;
  int balance;
  int amount;
  String symbol;
  String reason;

  RecordInfo({
    this.memberId,
    this.createDate,
    this.remark,
    this.balance,
    this.amount,
    this.symbol,
    this.reason
  });

  RecordInfo.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    createDate = json['createDate'];
    remark = json['remark'];
    balance = json['balance'];
    amount = json['amount'];
    symbol = json['symbol'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberId'] = this.memberId;
    data['createDate'] = this.createDate;
    data['remark'] = this.remark;
    data['balance'] = this.balance;
    data['amount'] = this.amount;
    data['symbol'] = this.symbol;
    data['reason'] = this.reason;
    return data;
  }
}
