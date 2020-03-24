import 'package:flutter/material.dart';
import 'package:hashtags/Result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  List<bool> options;
  String input, result;

  @override
  void initState() {
    super.initState();
    options = List();
    for (int i = 0; i < 5; i++) {
      options.add(false);
    }
    input = result = '';
  }

  update(String input) {
    setState(() {
      this.input = input;
    });
  }

  change(int option) {
    setState(() {
      options[option] = !options[option];
    });
  }

  getResult() {
    String t = '';
    if (!options[4] && input.length > 0) {
      t = '#';
    } else if (!options[1] && input.length > 0) {
      t = ',';
    }
    int n = input.length;
    for (int i = 0; i < n; i++) {
      if (input[i] == '.' && options[0]) {
        continue;
      }
      if (input[i] == ',' && options[1]) {
        if (!options[4]) {
          t += ' #';
        }
        continue;
      }
      if (input[i] == '@' && options[2]) {
        continue;
      }
      if (input[i] == '\$' && options[3]) {
        continue;
      }
      if (input[i] == '#' && options[4]) {
        if (!options[1]) {
          t += ' ,';
        }
        continue;
      }
      t += input[i];
    }
    setState(() {
      result = t;
    });
  }

  showResult() {
    getResult();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
          result: result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD3DCE0),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: data.size.width * 0.85,
                width: data.size.width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFF9FB4C4),
                  borderRadius: BorderRadius.circular(
                    data.size.width * 0.05,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Form(
                    key: formKey,
                    child: Container(
                      padding: EdgeInsets.all(
                        data.size.width * 0.03,
                      ),
                      child: TextFormField(
                        onChanged: (input) {
                          update(input);
                        },
                        autofocus: false,
                        style: TextStyle(
                          color: Color(0xFF4D6478),
                          fontSize: data.size.width * 0.06,
                        ),
                        cursorColor: Color(0xFF4D6478),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration.collapsed(
                          hintText: 'convert this',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: data.size.height * 0.08,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text(
                          'I want to delete :',
                          style: TextStyle(
                            color: Color(0xFF33475C),
                            fontSize: data.size.width * 0.08,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: data.size.height * 0.04,
                    ),
                    Container(
                      width: data.size.width * 0.85,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(5, (index) {
                            double height = data.size.width * 0.08;
                            double width = data.size.width * 0.08;
                            if (index == 0) {
                              height = data.size.width * 0.03;
                              width = data.size.width * 0.03;
                            } else if (index == 1) {
                              height = data.size.width * 0.05;
                              width = data.size.width * 0.05;
                            }
                            return GestureDetector(
                              onTap: () {
                                change(index);
                              },
                              child: Container(
                                height: data.size.width * 0.12,
                                width: data.size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: (options[index]
                                      ? Color(0xFF9FB4C4)
                                      : Color(0xFFD3DCE0)),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/O${index + 1}.png',
                                    height: height,
                                    width: width,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: data.size.height * 0.08,
              ),
              GestureDetector(
                onTap: showResult,
                child: Container(
                  height: data.size.width * 0.2,
                  margin: EdgeInsets.symmetric(
                    horizontal: data.size.width * 0.3,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF9FB4C4),
                    borderRadius: BorderRadius.circular(
                      data.size.width * 0.05,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Convert',
                      style: TextStyle(
                        color: Color(0xFF33475C),
                        fontSize: data.size.width * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
