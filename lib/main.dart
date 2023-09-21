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
      title: 'Assignment2',
      theme: ThemeData(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.MyGreen,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Assignment2'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  child: Opacity(
                opacity: 0.2,
                child: const Image(
                    image: AssetImage('assets/warning.png'), width: 200.0),
              )),
              const Text(
                'This page does not include contents',
              )
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Error Search'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Refresh'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {},
              ),
            ],
          ))
        ],
      ),
      drawer: Drawer(),
    );
  }
}
