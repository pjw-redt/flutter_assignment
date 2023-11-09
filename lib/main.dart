import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/measure': (context) => const MeasurePage(),
        '/milk': (context) => const MilkPage(),
        '/juice': (context) => const JuicePage(),
        '/sweet': (context) => const SweetPage(),
        '/coffee_again': (context) => const CoffeeAgainPage(),
        '/result': (context) => const ResultPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Beverage'),
      ),
      body: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('I want to help you choose the beverage.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              const Text('Let\'s start!', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Go', style: TextStyle(fontSize: 20)),
                onPressed: () {Navigator.pushNamed(context, '/measure');},
              ),
            ],
          ),
        ),
    );
  }
}

class SweetPage extends StatelessWidget {
  const SweetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Coffee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Do you want sweet coffee?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Yes', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/result', arguments: 'Mocha Latte');
                  },
                ),
                ElevatedButton(
                  child: Text('No', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/result', arguments: 'Caffe Latte');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeAgainPage extends StatelessWidget {
  const CoffeeAgainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Again'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Do you want some more coffee?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Yes', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sweet');
                  },
                ),
                ElevatedButton(
                  child: Text('Np', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/result', arguments: 'Sweet Potato Latte');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class MeasurePage extends StatefulWidget {
  const MeasurePage({Key? key}) : super(key: key);

  @override
  _MeasurePageState createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  int current_cups = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Your Coffee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How many cups of coffee did you drink?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('$current_cups cups' , style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('-', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    setState(() {
                      current_cups--;
                    });
                  },
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    setState(() {
                      current_cups++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next', style: TextStyle(fontSize: 20)),
              onPressed: () {
                if (current_cups > 1) {
                  Navigator.pushNamed(context, '/juice', arguments: current_cups);
                } else {
                  Navigator.pushNamed(context, '/milk', arguments: current_cups);
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}


class JuicePage extends StatelessWidget {
  const JuicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juice or Latte', style: TextStyle(fontSize: 20)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Since you drank $result of coffee,', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('you may not want coffee.', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Do you want juice or latte?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Juice', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/result', arguments: 'GrapefruitJuice');
                  },
                ),
                ElevatedButton(
                  child: Text('Latte', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/coffee_again');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MilkPage extends StatelessWidget {
  const MilkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Milk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Since you drank $result of coffee,', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('you may want coffee.', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Do you want milk in the coffee?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Yes', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sweet');
                  },
                ),
                ElevatedButton(
                  child: Text('No', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/result', arguments: 'Americano');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your best beverage is', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('$result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Icon(Icons.refresh), // You can change the icon to your preference
      ),
    );
  }
}

