import 'package:flutter/material.dart';

class exam extends StatefulWidget {
  const exam({super.key});

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  @override
  bool isch = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              Text('علاء بعاج بن محمد نضال'),
              Checkbox(
                value: isch,
                onChanged: (value) {
                  setState(() async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                    isch = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
