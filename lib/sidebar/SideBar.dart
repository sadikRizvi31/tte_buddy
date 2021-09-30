import 'package:flutter/material.dart';
import 'package:tte_buddy/utils/AppColor.dart';
import 'package:tte_buddy/views/LoginPage.dart';
import 'package:tte_buddy/views/ProfilePage.dart';
import 'package:tte_buddy/views/complaints/viewComplaintList.dart';

class SideBar extends StatefulWidget {
  @override
    _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
        color: AppColor.primarySwatchColor,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.account_circle_outlined,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Schedule',
              icon: Icons.calendar_today_outlined,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Urgent assist',
              icon: Icons.assignment_late_outlined,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Complain',
              icon: Icons.quick_contacts_mail_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Help Buddy',
              icon: Icons.live_help_outlined,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 24,),
            Divider(color: Colors.white70,),
            const SizedBox(height: 24,),

            const SizedBox(height: 24,),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 24,),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }){
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon,color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch(index){
        case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfilePage(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewComplaintList(),
        ));
        break;
      case 6:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
    }
  }
}
