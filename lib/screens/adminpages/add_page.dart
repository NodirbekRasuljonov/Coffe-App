import 'dart:io';
import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/constants/my_radius.dart';
import 'package:coffeapp/provider/coffe_provider.dart';
import 'package:coffeapp/provider/coffee_upload.dart';
import 'package:coffeapp/widgets/text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminAddPage extends StatelessWidget {
  String text = 'hello';
  XFile? image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (contex) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return  Container(
                      margin: const EdgeInsets.all(15.0),
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MyRadius.medium),
                        color: MyColorConst.kScaffoldColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Add new Coffee'),
                          Container(
                            height: 150.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyTextField(
                                    controller: contex
                                        .watch<CoffeeProvider>()
                                        .namecontroller,
                                    hintext: 'Name of new coffee'),
                                MyTextField(
                                  controller: contex
                                      .watch<CoffeeProvider>()
                                      .pricecontroller,
                                  hintext: 'Price of new coffee',
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {});
                            },
                            child: const Text('Upload Image Coffee'),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: image != null
                                ? Image.file(
                                    File(image!.path),
                                  )
                                : Text('Image not uploaded yet'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await contex
                                  .read<CoffeeUpload>()
                                  .uploadCoffeeToFireStore(
                                      name: Provider.of<CoffeeProvider>(context,
                                              listen: false)
                                          .namecontroller
                                          .text,
                                      price: Provider.of<CoffeeProvider>(
                                              context,
                                              listen: false)
                                          .pricecontroller
                                          .text,
                                      context: context);
                              setState(() {});
                            },
                            child: Text('Add a coffee to shop'),
                          )
                        ],
                      ),
                    );
                },
              );
            },
          );
        },
      ),
    );
  }
}
