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

  /// widget yang mengembalikan card dari bahan yang dimiliki
  Widget listTemplate(bahan) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
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
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                deleteBahan(bahan);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/food-taylorheery.jpg'),
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.15), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                  child: Text(
                    'Bahan - Bahan Yang Kamu Punya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 20,
                    ),
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
              Expanded(
                flex: 5,
                child: listViewBahan,
              ),
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
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  child: Container(
                      color: Colors.deepOrange[200],
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton.icon(
                          onPressed: () {
                            print(listBahan);
                          },
                          icon: Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Cari Resep!',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'IndieFlower',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                          color: Colors.deepOrange,
                        ),
                      )))
            ],
          ),
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
}
