import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'Api.dart';

class FormPage extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  FormPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textField = TextEditingController(text: '');

    void _sendMsg() {
      sendMsg(_textField.text);
      print('Success! = ${_textField.text}');
      Navigator.pop(context);
      return;
    }

    void _onSendClick() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        showDialog(
          context: context,
          builder: (builder) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Colors.white,
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Confirm Message to be sent?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '* ${_textField.text} *',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Text('Send'),
                          onPressed: _sendMsg,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    }

    Widget _form = Form(
      key: _formKey,
      child: TextFormField(
        controller: _textField,
        onChanged: (value) => _textField.value.copyWith(text: value),
        autofocus: true,
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a message.';
          }
          return null;
        },
        onSaved: (newValue) => _textField.value.copyWith(text: newValue),
      ),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('SMS Application'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    child: Expanded(
                      child: _form,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _onSendClick, child: Text('Send'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
