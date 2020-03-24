import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatefulWidget {
  final String result;

  Result({
    this.result,
  });

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final formKey = GlobalKey<FormState>();
  double opacity;

  @override
  void initState() {
    super.initState();
    opacity = 1.0;
  }

  copy() {
    final copiedData = ClipboardData(
      text: widget.result,
    );
    Clipboard.setData(copiedData);
    setState(() {
      opacity = 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFD3DCE0),
      body: Center(
        child: Container(
          child: Center(
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
                          enabled: false,
                          initialValue: widget.result,
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
                  height: data.size.height * 0.1,
                ),
                GestureDetector(
                  onTap: copy,
                  child: Container(
                    child: Opacity(
                      opacity: opacity,
                      child: Center(
                        child: Image.asset(
                          'images/copy.png',
                          height: data.size.width * 0.1,
                          width: data.size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: data.size.height * 0.2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        'images/back.png',
                        height: data.size.width * 0.1,
                        width: data.size.width * 0.1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
