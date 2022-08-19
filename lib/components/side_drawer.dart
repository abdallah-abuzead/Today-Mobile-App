import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:today/screens/home.dart';
import 'package:today/screens/welcome.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer(this.homeContext);
  final BuildContext homeContext;

  late final List<String?> choices;
  late final String? refresh, home, users, editMyAccount, resetPassword, deleteMyAccount, signOut;

  void setChoices() {
    refresh = 'Refresh';
    home = 'Projects';
    users = 'Users';
    editMyAccount = 'Edit My Account';
    resetPassword = 'Reset Password';
    deleteMyAccount = 'Delete My Account';
    signOut = 'Sign Out';
  }

  void initChoices(BuildContext context) {
    setChoices();
    // var rule = Provider.of<CurrentUserDataProvider>(context).rule;
    // if (rule == 1)
    //   choices = [
    //     refresh,
    //     vacations,
    //     editMyAccount,
    //     englishLanguage,
    //     arabicLanguage,
    //     resetPassword,
    //     signOut,
    //   ];
    // else if (rule == 2)
    //   choices = [
    //     refresh,
    //     vacationsRequests,
    //     employees,
    //     vacations,
    //     editMyAccount,
    //     englishLanguage,
    //     arabicLanguage,
    //     resetPassword,
    //     signOut,
    //   ];
    // else if (rule >= 3)
    choices = [
      refresh,
      home,
      users,
      editMyAccount,
      resetPassword,
      deleteMyAccount,
      signOut,
    ];
  }

  Widget getChoiceIcon(String choice) {
    if (choice == refresh)
      return Icon(Icons.refresh, color: Colors.teal);
    else if (choice == home)
      return Icon(Icons.home_outlined, color: Colors.teal);
    else if (choice == users)
      return Icon(Icons.supervised_user_circle_outlined, color: Colors.teal, size: 20);
    else if (choice == editMyAccount)
      return Icon(Icons.edit, color: Colors.teal, size: 18);
    else if (choice == resetPassword)
      return Icon(Icons.lock_open, color: Colors.teal, size: 18);
    else if (choice == deleteMyAccount)
      return Icon(Icons.delete, color: Colors.teal, size: 18);
    else
      return Icon(Icons.logout, color: Colors.teal);
  }

  void getChoiceAction(BuildContext context, String choice) async {
    if (choice == refresh)
      Navigator.of(context).pushReplacementNamed(ModalRoute.of(context)?.settings.name as String);
    else if (choice == home)
      Navigator.pushNamed(context, Home.id);
    // else if (choice == users)
    //   Navigator.pushNamed(context, Users.id);

    // else if (choice == editMyAccount)
    //   Navigator.pushNamed(context, EditMyAccount.id);
    // else if (choice == resetPassword)
    //   Navigator.pushNamed(context, ResetPassword.id);
    // else if (choice == deleteMyAccount)
    //   deleteMyAccountDialog(homeContext);
    else {
      // showSpinner(context);
      // await UserModel.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil(Welcome.id, (route) => false);
    }
  }

  // void deleteMyAccountDialog(BuildContext context) {
  //   showAlertDialog(
  //     context: context,
  //     title: tr('delete_my_account_alert'),
  //     actionButtonOnPressed: () async {
  //       await UserModel.deleteUser(UserModel.currentUserEmail);
  //       Navigator.of(context).pushNamedAndRemoveUntil(Welcome.id, (route) => false);
  //     },
  //   );
  // }

  // void resetVacationsDialog(BuildContext context) {
  //   showAlertDialog(
  //     context: context,
  //     title: tr('reset_all_vacations_alert'),
  //     actionButtonText: tr('reset_button'),
  //     actionButtonOnPressed: () async {
  //       Navigator.of(context).pop();
  //       showAlertDialog(
  //         context: context,
  //         title: tr('delete_all_vacations_alert'),
  //         actionButtonOnPressed: () async {
  //           Navigator.of(context).pop();
  //           showSpinner(context);
  //           await FirebaseFirestore.instance.collection('employee_vacation').get().then((vacs) {
  //             vacs.docs.forEach((vac) async {
  //               vac.reference.delete();
  //             });
  //           });
  //           print('all vacations deleted');
  //           Navigator.of(context).pushNamedAndRemoveUntil(HomePage.id, (route) => false);
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Map currentUser = Provider.of<CurrentUserDataProvider>(context).currentUser;
    initChoices(context);

    return Drawer(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
            // decoration: BoxDecoration(color: kMainColor),
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Welcome Ahmed',
                      // 'Welcome' + ' ' + currentUser['name'].split(' ')[0],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    // leading: currentUser['image_url'] == ''
                    //     ? CircleAvatar(radius: 30, backgroundImage: AssetImage('images/avatar.png'))
                    //     : CircleAvatar(radius: 30, backgroundImage: NetworkImage(currentUser['image_url'])),
                    leading: CircleAvatar(radius: 30, backgroundImage: AssetImage('images/avatar.png'))),
                SizedBox(height: 10),
                // Row(
                //   children: [
                //     Icon(Icons.rule, size: 20, color: Colors.blueGrey.shade100),
                //     SizedBox(width: 15),
                //     Text(tr(currentUser['rule_name']), style: kUserDataTextStyle),
                //   ],
                // ),
                Row(
                  children: [
                    Icon(Icons.email, size: 20, color: Colors.blueGrey.shade100),
                    SizedBox(width: 15),
                    Text('ahmed@kayan.eg'),
                    // Text(currentUser['email'], style: kUserDataTextStyle),
                  ],
                ),
                // currentUser['phone'] == ''
                //     ? Container()
                //     :
                Row(
                  children: [
                    Icon(Icons.phone, size: 20, color: Colors.blueGrey.shade100),
                    SizedBox(width: 15),
                    Text('01123362002'),
                    // Text(currentUser['phone'], style: kUserDataTextStyle),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: choices.length,
              separatorBuilder: (context, i) {
                return Divider(
                  thickness: 2,
                  height: 0,
                );
              },
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text('${choices[i]}', style: TextStyle(fontSize: 16)),
                  trailing: getChoiceIcon('${choices[i]}'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  hoverColor: Colors.grey.shade300,
                  visualDensity: VisualDensity.compact,
                  onTap: () {
                    Navigator.pop(context);
                    getChoiceAction(context, choices[i].toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
