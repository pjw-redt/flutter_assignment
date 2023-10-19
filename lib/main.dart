import 'package:flutter/material.dart';
import 'style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(), // title은 제목
    );
  }
}

class StudentResult {
  String name;
  int projectpoint;
  int additionalpoint;

  StudentResult(this.name, this.projectpoint, this.additionalpoint);

  @override
  String toString(){
    return 'StudentResult{name: $name, projectpoint: $projectpoint, additionalpoint: $additionalpoint}';
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  StudentResult studentResult = StudentResult('', 0, 0);
  List items = ['Jiwoo : 80', 'Siwoo : 100'];

ReorderableListView makeList(){
    return ReorderableListView.builder(
      itemCount: items.length,
      itemBuilder: (c,i) {
        return Dismissible(
          background: Container(color: Colors.red),
          key: ValueKey(items[i]),
          child: ListTile(
            title: Text('${items[i]}'),
            leading: Icon(Icons.home),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(i);
            });
          },
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if(oldIndex < newIndex) {
            newIndex -= 1;
          }
          items.insert(newIndex, items.removeAt(oldIndex));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold( // Scaffold로 감싸기
        appBar: AppBar(
          centerTitle: false,
          title: Text('Grade Calculator', textAlign: TextAlign.left),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(text: 'Information'),
            Tab(text: 'List'),
          ]),// AppBar 추가
        ),
        body: TabBarView(
          children: [
            Tab(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        } else if(int.tryParse(value) != null){
                          return 'Please enter some string, not a number';
                        } return null;
                      },
                      onSaved: (value) {
                        studentResult.name = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Project point',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your project point';
                        } else if(int.tryParse(value) == null){
                          return 'Please enter some integer.';
                        } return null;
                      },
                      onSaved: (value) {
                        studentResult.projectpoint = int.parse(value!);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Additional point',
                      ),
                      value: studentResult.additionalpoint,
                      items: List.generate(11, (i) {
                        if(i==0){
                          return DropdownMenuItem(
                            value: i,
                            child: const Text('Choose the additional point')
                          );
                        }
                        return DropdownMenuItem(
                          value: i,
                          child: Text('${i-1} point')
                        );
                      }),
                      onChanged: (value){
                        setState(() {
                          studentResult.additionalpoint = value!;
                        });
                      },
                      validator: (value) {
                        if(value == 0){
                          return 'Please select the point';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.blue,
                        height: 50,
                        child: const Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Enter', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            _formKey.currentState!.save();
                            items.add('${studentResult.name}: ${studentResult.projectpoint + studentResult.additionalpoint-1}');
                          }
                        });
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
          Tab(
            child: makeList(),
          ),]
        ),
      ),
    );
  }
}

