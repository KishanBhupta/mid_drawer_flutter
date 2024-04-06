import 'package:flutter/material.dart';

import 'drawermenu.dart';
import 'student.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.list});
  final List<Student> list  ;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Drawer Demo"),),
      drawer: DrawerMenu(list: widget.list,),
      body: ListView.builder(
        itemCount: widget.list.length,
          itemBuilder: (context,index){
        return ListTile(
          onTap: (){

            setState(() {
              widget.list.removeAt(index);
            });
          },
          leading: Icon(Icons.person),
          trailing: Icon(Icons.delete) ,
          title: Text("${widget.list[index].name}"),
          subtitle: Text("${widget.list[index].rollno}"),
        );
      }
      ),
    );
  }
}
