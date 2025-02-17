import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String,dynamic>> tasks = [];
  bool showActiveTask = true;

  void _showTaskDialog({int? index}){
    TextEditingController _taskController = TextEditingController();

    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("Add Task",style: TextStyle(fontWeight: FontWeight.bold),),
      content: TextField(
        decoration: InputDecoration(
          hintText: 'Enter Task'
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
            ),
            onPressed: (){}, child: Text("Save"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
      title: Text("Todo App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(16),
                  child:  Column(
                    children: [
                      Text('Active',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.black),),
                      Text('10',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                        )
                      ]
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Completed',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: Colors.black),),
                      Text('10',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>_showTaskDialog(), child : Icon(Icons.add),),
    );
  }
}
