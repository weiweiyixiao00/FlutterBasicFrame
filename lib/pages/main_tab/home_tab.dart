
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {

  ///保存一条数据
  _saveSingle(BuildContext context) {
    // BmobUser bmobUser = BmobUser();
    // bmobUser.objectId = "7c7fd3afe1";
    // UserModel userModel = UserModel();
    // userModel.username = '张三';
    // userModel.mobilePhoneNumber = '18600001111';
    // userModel.save().then((BmobSaved bmobSaved) {
    // String message =
    //     "创建一条数据成功：${bmobSaved.objectId} - ${bmobSaved.createdAt}";
    // // String currentObjectId = bmobSaved.objectId;
    //   Utils.showToast(message);
    // }).catchError((e) {
    //   Utils.showToast(BmobError.convert(e).error);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () => Navigator.pushNamed(context, 'record_list'),
                child: Text(
                  '会员消费记录',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => _saveSingle(context),
                child: Text(
                  '会员消费记录',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}