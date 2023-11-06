import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/UI/datapost.dart';
import 'package:real_estate/models/errMsg.dart';
import 'package:real_estate/models/post.dart';
import 'package:real_estate/models/real_estate.dart';
import 'package:real_estate/services/api.dart';

class InputPost extends StatefulWidget {
  final Post post;
  InputPost({required this.post});

  // const InputPost({super.key, required Post post});

  @override
  State<InputPost> createState() => _InputPostState();
}

class _InputPostState extends State<InputPost> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController judul,
      // category,
      user,
      deskripsi,
      status;

  late int id = 0;
  bool _isupdate = false;
  bool _validate = false;
  bool _success = false;
  late ErrorMSG response;
  late String _imagePath = '';
  late String _imageURL = '';
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    judul = TextEditingController();
    // category = TextEditingController();
    user = TextEditingController();
    deskripsi = TextEditingController();
    // image = TextEditingController();
    status = TextEditingController();
    // selectedCategory = widget.post.category;
    if (widget.post.id != 0) {
      id = widget.post.id;
      judul = TextEditingController(text: widget.post.judul);
      // category = TextEditingController(text: widget.post.category);
      user = TextEditingController(text: widget.post.user);
      deskripsi = TextEditingController(text: widget.post.deskripsi);
      status = TextEditingController(text: widget.post.status);
      _isupdate = true;
      _imageURL = ApiStatic.host + '/storage/' + widget.post.image;
    }

    super.initState();
  }

  // func submit
  void submit() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      var params = {
        'judul': judul.text.toString(),
        'user': user.text.toString(),
        'deskripsi': deskripsi.text.toString(),
        'status': status.text.toString(),
      };
      response = await ApiStatic.savePost(id, params, _imagePath);
      _success = response.success;
      final snackBar = SnackBar(
        content: Text(response.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (_success) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => DataPosts()));
      } else {}
    } else {
      _validate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate
            ? Text('Update ' + widget.post.judul)
            : Text('Input data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: judul,
                    validator: (u) => u == "" ? "Wajib isi" : null,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.judul),
                        hintText: "Judul",
                        labelText: "Judul"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: user,
                    validator: (u) => u == "" ? "Wajib isi" : null,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.judul),
                        hintText: "Author",
                        labelText: "Author"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: status,
                    validator: (u) => u == "" ? "Wajib isi" : null,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.judul),
                        hintText: "Status",
                        labelText: "Status"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.image),
                      Flexible(
                          child: _imagePath != ''
                              ? GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(_imagePath),
                                      fit: BoxFit.fitWidth,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                    ),
                                  ),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  })
                              : _imageURL != ''
                                  ? GestureDetector(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          _imageURL,
                                          fit: BoxFit.fitWidth,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                        ),
                                      ),
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      })
                                  : GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                        height: 100,
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                            ),
                                            Text(
                                              " Pilih Gambar .",
                                              style: TextStyle(
                                                  // color: Colors.white,
                                                  backgroundColor: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.brown,
                                                    width: 2))),
                                      ),
                                    ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: deskripsi,
                    validator: (u) => u == "" ? "Wajib isi" : null,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.judul),
                        hintText: "Deskripsi",
                        labelText: "Deskripsi"),
                  ),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          submit();
                        },
                        child: Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage(ImageSource media) async {
    var img = await _picker.pickImage(source: media);
    //final pickedImageFile = File(img!.path);
    setState(() {
      _imagePath = img!.path;
      print(_imagePath);
    });
  }
}
