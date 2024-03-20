// import 'package:flutter/material.dart';
// import 'package:todo_list/store_varible.dart';
//
// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);
//
//   @override
//   State<TodoList> createState() => _TodoListState();
// }
//
// class _TodoListState extends State<TodoList> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//
//   Widget customList() {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Text(storeVarible.todoList[index]['name']),
//           subtitle: Text(storeVarible.todoList[index]['email']),
//         );
//       },
//       itemCount: storeVarible.todoList.length,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () {
//         setState(() {});
//         return Future.value();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('To Do List'),
//         ),
//         body: customList(),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           foregroundColor: Colors.white,
//           child: Icon(Icons.add),
//           onPressed: () {
//             showDialog<void>(
//               context: context,
//               barrierDismissible: false,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Add Task'),
//                   content: SingleChildScrollView(
//                     child: ListBody(
//                       children: <Widget>[
//                         Text('Insert Data'),
//                         TextFormField(
//                           controller: name,
//                           decoration: InputDecoration(labelText: 'Name'),
//                         ),
//                         TextFormField(
//                           controller: email,
//                           decoration: InputDecoration(labelText: 'Email'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   actions: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         Map<String, dynamic> data = {
//                           'name': name.text,
//                           'email': email.text
//                         };
//                         setState(() {
//                           storeVarible.todoList.add(data);
//                           Navigator.pop(context);
//                         });
//                       },
//                       child: Text('Add Task'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class storeVarible {
//   static List<Map<String, dynamic>> todoList = [];
// }
