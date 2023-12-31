import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/models/product.dart';
import 'package:real_estate/services/databasehelper.dart';

class ProductAdd extends StatefulWidget {
  final Product _product;
  ProductAdd(this._product);

  @override
  State<ProductAdd> createState() => _ProductAddState(this._product);
}

class _ProductAddState extends State<ProductAdd> {
  final Product _product;
  _ProductAddState(this._product);
  late final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditing = false;
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  Future<void> addOrEditUser() async {
    String desc = descriptionController.text;
    String name = nameController.text;
    String code = codeController.text;

    if (!isEditing) {
      Product product =
          new Product(name: name, code: code, description: desc, category: '');
      //await addProduct(product);
      await dbHelper.insertProduct(product);
    } else {
      _product.description = desc;
      _product.code = code;
      _product.name = name;
      _product.category = '';
      //await updateProduct(_product);
      await dbHelper.updateProduct(_product);
    }
    // ignore: use_build_context_synchronously
    Navigator.pop(context, true);

    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //   return ProductPage();
    // }));
    resetData();
    setState(() {});
  }

  // Future<int?> addProduct(Product product) async {
  //   return await dbHelper.insertProduct(product);
  // }

  // Future<int?> updateProduct(Product product) async {
  //   return await dbHelper.updateProduct(product);
  // }

  void resetData() {
    nameController.clear();
    descriptionController.clear();
    codeController.clear();
    isEditing = false;
  }

  Widget build(BuildContext context) {
    nameController.text = widget._product.name;
    codeController.text = widget._product.code;
    descriptionController.text = widget._product.description;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Estate Page"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: new Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Product name',
                                labelText: 'Name'),
                          ),
                          TextFormField(
                            controller: codeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                                hintText: 'Enter Product Code',
                                labelText: 'Code'),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Product Description',
                                labelText: 'Description'),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Container(
                                    margin:
                                        new EdgeInsets.symmetric(vertical: 10),
                                    child: new ElevatedButton(
                                      child: const Text('Submit'),
                                      onPressed: addOrEditUser,
                                    )),
                              ])
                        ])))
              ],
            )),
          ],
        ));
  }
}
