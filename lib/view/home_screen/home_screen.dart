import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_project_practise/controller/my_controller.dart';
import 'package:new_project_practise/view/home_screen/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController editnameController = TextEditingController();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  List mylist = [];
  @override
  Widget build(BuildContext context) {
    final MyControllerobj = MyController();
    return Scaffold(
      body: StreamBuilder(
        stream: userCollection.snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              //document snapshot
              DocumentSnapshot users = snapshot.data!.docs[index];
              return HomeScreenWidget(
                title: users["name"],
                onDeletePressed: () {
                  MyControllerobj.deleteData(id: users.id);
                },
                onEditPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextField(
                                controller: editnameController = nameController,
                                decoration: InputDecoration(
                                    hintText: "Enter anything..",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  MyControllerobj.editData(
                                      id: users.id, name: nameController.text);
                                  //setState(() {});
                                  nameController.clear();
                                  Navigator.pop(context);
                                },
                                child: Text("Save"))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: false,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Enter anything..",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          MyControllerobj.addData(name: nameController.text);
                          //setState(() {});
                          nameController.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Save"))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
