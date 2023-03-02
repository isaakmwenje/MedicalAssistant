import 'package:flutter/material.dart';

import '../../controllers/outh_controller.dart';

class DashBoardDrawer extends StatefulWidget {
  const DashBoardDrawer({Key? key}) : super(key: key);

  @override
  State<DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width:double.infinity,
              height:240,
              decoration:const BoxDecoration(
                color:Colors.blue,
              ),
              ),
              Positioned(
                left:90,
                top:60,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                      color:Colors.blue,
                      shape: BoxShape.circle),
                  child: Padding(
                    //this padding will be you border size
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage:AssetImage('assets/stethoscope.png'),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
          child: Text(
            'ACCOUNT',
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 1,
            ),
          ),
        ),

        //name
        ListTile(
          dense: true,
          leading:  Icon(
            Icons.person_outlined,
            color: Colors.blueGrey,
            size: 24,
          ),
          title: Text(
            'account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          subtitle: Text(
            OuthController.instance.email??'email',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Divider(height: 1),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
          child: Text(
            'GENERAL',
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 1,
            ),
          ),
        ),

        // notifs
        ListTile(
          dense: true,
          leading: Icon(
            Icons.notifications_active_outlined,
            color: Colors.blueGrey,
            size: 24,
          ),
          title: Text(
            'Notifications',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          subtitle: Text(
            'Manage your preferences for notifications',
          ),
        ),
        Divider(height: 1.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
          child: Text(
            'FEEDBACK',
            style: TextStyle(
              fontSize: 12.0,
              letterSpacing: 1,
            ),
          ),
        ),

        //bug report
        ListTile(
          dense: true,
          leading: Icon(
            Icons.bug_report_outlined,
            color: Colors.blueGrey,
            size: 24,
          ),
          title: Text(
            'Report Bug',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.blueGrey,
          ),
        ),

        //feedback
        const ListTile(
          dense: true,
          leading: Icon(
            Icons.feedback_outlined,
            color: Colors.blueGrey,
            size: 24,
          ),
          title: Text(
            'Feedback',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.blueGrey,
          ),
        ),
        Divider(height: 1.0),
         GestureDetector(
           onTap:(){
             OuthController.instance.signOut();
           },
           child:const ListTile(
              dense: false,
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: Colors.red,
                size: 24,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
         ),
      ]
    );
  }
}
