import 'package:flutter/material.dart';
import 'style.dart';

enum Role { leader, member }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(), // title은 제목
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // 우리가 보고있는 화면

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  // bool _isChecked2 = false;

  Role _role = Role.member;

  final _valueList = List.generate(10, (i) => '$i point');
  var _selectedValue = '0 point';

  String _grade = 'A';
  final _midtermController =
  TextEditingController(); // 텍스트 필드에 입력된 값을 가져오기 위한 컨트롤러
  final _finalController =
  TextEditingController(); // 텍스트 필드에 입력된 값을 가져오기 위한 컨트롤러

  void dispose() {
    _midtermController.dispose();
    _finalController.dispose(); // 컨트롤러를 사용한 뒤에는 반드시 해제해야 함
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      drawer: Drawer(),
      body:

      Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mid-term exam',
                ),
                controller: _midtermController,
                keyboardType: TextInputType.number,
              ),
              Container(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Final exam',
                ),
                controller: _finalController,
                keyboardType: TextInputType.number,
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView( // 라디오 버튼 목록의 ListView
                  children: [
                    RadioListTile(
                      title: Text('Project Team Leader (+10)'),
                      value: Role.leader,
                      groupValue: _role,
                      onChanged: (value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Project Team Member'),
                      value: Role.member,
                      groupValue: _role,
                      onChanged: (value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(height: 20),
              Row(
                children: [
                  Container(width: 17),
                  Text('Addition Point', style: TextStyle(fontSize: 17)),
                  Container(width: 175),
                  DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map(
                            (student) => DropdownMenuItem(
                            value: student,
                            child: Text(student))).toList(),
                    onChanged: (value){
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
              CheckboxListTile( // Switch도 있고, SwtichListTile, CheckboxListTile도 있음, 여러 개 만들고자 할 때는 ListView를 사용
                title: Text('Absence less than 4', style: TextStyle(fontSize: 17)),
                value: _isChecked,
                onChanged: (value) {
                  setState(() { // 상태를 바꿔주는 함수
                    _isChecked = value!; // !는 null이 아니라고 보증해주는 것
                  });
                },
              ),
              Text(_grade, style: TextStyle(fontSize: 40, color: Colors.red), textAlign: TextAlign.center),
              Container(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var midtermValue =
                      double.parse(_midtermController.text.trim());
                      var finalValue =
                      double.parse(_finalController.text.trim());
                      var addValue = double.parse(_selectedValue.substring(0,1));
                      var totalpoint = midtermValue + finalValue + addValue;
                      if(_role == Role.leader){
                        totalpoint += 10;
                      }
                      if(_isChecked == true){
                        _grade = 'F';
                      }
                      else{
                        if(totalpoint >= 170){
                          _grade = 'A';
                        }
                        else if(totalpoint >= 150){
                          _grade = 'B';
                        }
                        else if(totalpoint >= 130){
                          _grade = 'C';
                        }
                        else if(totalpoint >= 110){
                          _grade = 'D';
                        }
                        else{
                          _grade = 'F';
                        }
                      }
                    });
                  },
                  child: Text('Enter')
              ),
            ],
          ),
        ),
    );
  }
}
