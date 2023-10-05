import 'package:flutter/material.dart';
import 'style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment3',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.indigo,
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text('Assignment3'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.image)),
              Tab(icon: Icon(Icons.how_to_vote)),
              Tab(icon: Icon(Icons.upload)),
            ],
          )
          ),
        body: TabBarView(
          children: [
            Tab(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(16, (i) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/dog_images/dog_${i+1}.jpeg'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Text('Cendidate', style: TextStyle(fontSize: 20.0)),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(child: Text('Dog1', style: TextStyle(fontSize: 13.0, color: Colors.red))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(child: Text('Dog2', style: TextStyle(fontSize: 13.0, color: Colors.blue))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Center(child: Text('Dog3',
                              style: TextStyle(fontSize: 13.0, color: Colors.green)),
                          ),
                        ),
                      ),
                      )],
                  ),
                  Text('Vote rate', style: TextStyle(fontSize: 20.0)),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Colors.red,
                          width: 100,
                          height: 100,
                          child: Center(child: Text('50%', style: TextStyle(fontSize: 13.0))),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue,
                          width: 100,
                          height: 100,
                          child: Center(child: Text('20%', style: TextStyle(fontSize: 13.0))),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                          width: 100,
                          height: 100,
                          child: Center(child: Text('30%', style: TextStyle(fontSize: 13.0))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Tab(
              child: LinearProgressIndicator(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.photo_album), label: 'album'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
          ]
        )
      ),
    );
  }
}
