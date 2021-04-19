// import 'package:data_plugin/bmob/table/bmob_object.dart';

// class UserModel extends BmobObject{
//   String name;
//   String id;
//   String username;
//   String objectId;
//   String mobilePhoneNumber;
//   String createDate;

//   UserModel({
//     this.name,
//     this.id,
//     this.username,
//     this.objectId,
//     this.mobilePhoneNumber,
//     this.createDate,
//   });

//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     objectId = json['objectId'];
//     mobilePhoneNumber = json['mobilePhoneNumber'];
//     createDate = json['createDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['objectId'] = this.objectId;
//     data['mobilePhoneNumber'] = this.mobilePhoneNumber;
//     data['createDate'] = this.createDate;
//     return data;
//   }

//   @override
//   Map getParams() {
//     return this.toJson();
//   }
// }