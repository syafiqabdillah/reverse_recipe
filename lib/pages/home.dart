import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rere/classes/bahan.dart';
import 'package:rere/pages/add_bahan.dart';

class Home extends StatefulWidget {
  _HomeState state;

  @override
  _HomeState createState() {
    this.state = new _HomeState();
    return this.state;
  }
}

class _HomeState extends State<Home> {
  List<Bahan> listBahan = [];
  List<Bahan> newListBahan;
  Widget listViewBahan;

  @override
  Widget build(BuildContext context) {
    // check kalau dapat bahan baru dari page add_bahan
    newListBahan = ModalRoute.of(context).settings.arguments;
    if (newListBahan != null) {
      setState(() {
        listBahan = newListBahan;
      });
    }

    // listview widget based on list bahan
    if (listBahan.isNotEmpty) {
      List<Bahan> reverseListBahan = listBahan.reversed.toList();
      listViewBahan = ListView.builder(
        itemCount: reverseListBahan.length,
        itemBuilder: (context, index) {
          return listTemplate(reverseListBahan[index]);
        },
      );
    } else {
      listViewBahan = Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Masih kosong nih :(',
              style: TextStyle(fontFamily: 'IndieFlower', fontSize: 20),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text(
          'Reverse Recipe',
          style: TextStyle(
              fontFamily: 'IndieFlower',
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Bahan - Bahan Yang Kamu Punya',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Divider(
                height: 20,
                color: Colors.grey[500],
              ),
            ),
            Expanded(flex: 5, child: listViewBahan),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () async {
                        final bahanBaru = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddBahan()));
                        if (bahanBaru != null) {
                          setState(() {
                            listBahan.add(bahanBaru);
                          });
                        }
                      },
                      elevation: 2.0,
                      fillColor: Colors.deepOrange[400],
                      child: Icon(
                        Icons.add,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.deepOrange[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          print(listBahan);
                        },
                        child: Text(
                          'Cari Resep!',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'IndieFlower',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  deleteBahan(Bahan bahan) {
    print('deleting ${bahan.nama}');
    List<Bahan> newList = listBahan.where((item) {
      return item.nama != bahan.nama;
    }).toList();
    setState(() {
      listBahan = newList;
      newListBahan = newList;
    });
  }

  Widget listTemplate(bahan) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Text(
                bahan.nama,
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 20,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                deleteBahan(bahan);
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
