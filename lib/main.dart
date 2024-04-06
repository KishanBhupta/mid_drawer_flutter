
import 'package:drawerdemo/drawermenu.dart';
import 'package:flutter/material.dart';

import 'student.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(list: [],),
  //     routes: {
  // '/screen1': (context) => AddScreen(),
  // '/screen2': (context) => EditScreeen(),
  // '/screen3': (context) => ProfileScreen(),
  // },
  ));
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.list});
  final List<Student> list ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController rollnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  List<Student> studlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Drawer Demo"),),
      drawer:  DrawerMenu(list: studlist,),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Add Student ",style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600),),
            const SizedBox(height: 8,),
            TextField(
              controller:rollnoController,
              decoration: const InputDecoration(labelText: "Enter Roll no :"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8,),
            TextField(
              controller:nameController,
              decoration: const InputDecoration(labelText: "Enter Name :"),
            ),
            const SizedBox(height: 8,),
            TextField(
              controller:cityController,
              decoration: const InputDecoration(labelText: "Enter city :"),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  var stud = Student();
                  stud.rollno = int.parse(rollnoController.text.toString());
                  stud.name = nameController.text.toString();
                  stud.city = cityController.text.toString();
                  studlist.add(stud);
                },
                child: const Text("Submit")),
            
          ],
        ),
      ) ,

    );
  }
}
