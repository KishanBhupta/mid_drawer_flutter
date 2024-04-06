
import 'package:drawerdemo/editscreen.dart';
import 'package:drawerdemo/main.dart';
import 'package:drawerdemo/profilescreen.dart';
import 'package:flutter/material.dart';

import 'student.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key, required this.list});
  final List<Student> list  ;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int? index ;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(16),
        children:  [
          const DrawerHeader(decoration :  BoxDecoration(
            color : Colors.blueAccent,
          ), child: Text("Drawer Header "),),
          ListTile(
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.navigate_next),
            title: const Text("Home"),
            onTap: (){
              // Navigator.pushNamed(context, '/screen1');
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(list: widget.list,)));
              }
              ),
          ListTile(
              onTap: (){
                // Navigator.pushNamed(context, '/screen1');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreeen(list: widget.list,)));
                },
            leading: const Icon(Icons.edit),
            trailing: const Icon(Icons.navigate_next),
            title: const Text("Edit"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.navigate_next),
            title: const Text("Profile"),
              onTap: (){
                // Navigator.pushNamed(context, '/screen1');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen(list: widget.list,)));
              }
          ),
        ],
      ) ,
    );
  }
}
