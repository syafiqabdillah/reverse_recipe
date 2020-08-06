import 'package:flutter/material.dart';
import 'package:rere/classes/bahan.dart';

class AddBahan extends StatefulWidget {
  @override
  _AddBahanState createState() => _AddBahanState();
}

class _AddBahanState extends State<AddBahan> {
  final _formKey = GlobalKey<FormState>();
  String nama_bahan_baru;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text(
          'Punya Bahan Apa Lagi ?',
          style: TextStyle(
              fontFamily: 'IndieFlower',
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    nama_bahan_baru = value;
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.fastfood),
                  labelText: 'Nama Bahan',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                cursorColor: Colors.deepOrange[400],
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Bahan new_bahan = Bahan(id: 'a', nama: nama_bahan_baru);
                    // close the screen and return new_bahan as the result
                    Navigator.pop(context, new_bahan);
                  }
                },
                child: Text(
                  'Tambahkan',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.deepOrange[400],
              )
            ],
          ),
        ),
      ),
    );
  }
}
