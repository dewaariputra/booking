// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/models/product.dart';
import 'package:real_estate/pages/addproduct.dart';
import 'package:real_estate/services/databasehelper.dart';
import 'package:real_estate/pages/products.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late DatabaseHelper dbHelper;
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() async {
      setState(() {});
    });
  }

  // Future<void> addOrEditUser() async {
  //   String desc = descriptionController.text;
  //   String name = nameController.text;
  //   String code = codeController.text;

  //   if (!isEditing) {
  //     Product product =
  //         new Product(name: name, code: code, description: desc, category: '');
  //     await addProduct(product);
  //   } else {
  //     _product.description = desc;
  //     _product.code = code;
  //     _product.name = name;
  //     _product.category = '';
  //     await updateProduct(_product);
  //   }
  //   resetData();
  //   setState(() {});
  // }

  void deleteProduct(int id) async {
    return await dbHelper.deleteProduct(id);
  }
  // void populateFields(Product product) {
  //   _product = product;
  //   nameController.text = _product.name;
  //   codeController.text = _product.code;
  //   descriptionController.text = _product.description;
  //   isEditing = true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Real Estate"),
        ),
        body: userWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProductAdd(
                  Product(name: "", code: "", category: "", description: ""));
            })).then((value) => {setState(() {})});
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ));
  }

  Widget userWidget() {
    return FutureBuilder(
      future: dbHelper.retrieveProducts(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, position) {
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.delete_forever),
                    ),
                    key: UniqueKey(),
                    onDismissed: (DismissDirection direction) async {
                      await dbHelper
                          .deleteProduct(snapshot.data![position].id!);
                    },
                    child: new GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      //onTap: () => populateFields(snapshot.data![position]),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductAdd(snapshot.data![position]);
                      })).then((value) => {setState(() {})}),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      snapshot.data![position].name,
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      snapshot.data![position].code.toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data![position].description
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ));
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
