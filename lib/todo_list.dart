import 'package:flutter/material.dart';
import 'package:todo_list/store_varible.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  Widget CustomeList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(storeVarible.todoList[index]['name']),
            subtitle: Text(storeVarible.todoList[index]['email']),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  storeVarible.todoListcomplete
                      .add(storeVarible.todoList.elementAt(index));
                  storeVarible.todoList.removeAt(index);
                });
              },
              icon: Icon(Icons.done),
            ),
          ),
        );
      },
      itemCount: storeVarible.todoList.length,
    );
  }

  Widget CustomeListComplete() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(storeVarible.todoListcomplete[index]['name']),
            subtitle: Text(storeVarible.todoListcomplete[index]['email']),
          ),
        );
      },
      itemCount: storeVarible.todoListcomplete.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {});

        return Future.value();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('To Do List'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Text('Pending')),
                  Tab(icon: Text('Complete')),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                CustomeList(),
                CustomeListComplete()

                // Icon(Icons.directions_bike),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
              onPressed: () {
                showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Insert Data'),
                              TextFormField(
                                controller: name,
                              ),
                              TextFormField(
                                controller: email,
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                print(name.text);
                                print(email.text);

                                Map<String, dynamic> data = {
                                  'name': '${name.text}',
                                  'email': '${email.text}',
                                };
                                setState(() {
                                  print(storeVarible.todoList);
                                  storeVarible.todoList.add(data);
                                  print(storeVarible.todoList);

                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Add Data'))
                        ],
                      );
                    });
              },
            )),
      ),
    );
  }
}

class storeVarible {
  static List<Map<String, dynamic>> todoList = [];
  static List<Map<String, dynamic>> todoListcomplete = [];
}
