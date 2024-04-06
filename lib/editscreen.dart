import 'package:flutter/material.dart';

import 'drawermenu.dart';
import 'student.dart';

class EditScreeen extends StatefulWidget {
  const EditScreeen({super.key, required this.list});
  final List<Student>  list ;

  @override
  State<EditScreeen> createState() => _EditScreeenState();
}

class _EditScreeenState extends State<EditScreeen> {
  TextEditingController rollno = TextEditingController();
  TextEditingController rollnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  int? index ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Drawer Demo"),),
      drawer:  DrawerMenu(list: widget.list,),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: rollno,
              decoration: const InputDecoration(labelText: "Enter Roll No "),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                index = widget.list.indexWhere((element) => element.rollno == int.parse(rollno.text.toString()));
                if((index ?? -1)>= 0) {
                  rollnoController.text = widget.list[index!].rollno.toString();
                  nameController.text = widget.list[index!].name.toString();
                  cityController.text = widget.list[index!].city.toString();

                }
              });
            }, child: const Text("Find")
            ),
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
                  setState(() {
                    widget.list[index!].rollno = int.parse(rollnoController.text.toString());
                    widget.list[index!].name = nameController.text.toString();
                    widget.list[index!].city = cityController.text.toString();

                  });
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}