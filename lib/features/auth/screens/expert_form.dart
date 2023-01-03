import 'dart:io';

import 'package:animated_background/animated_background.dart';
import 'package:appointments/common/animations/page_transition.dart';
import 'package:appointments/common/widgets/custom_textfield.dart';
import 'package:appointments/common/widgets/title_widget.dart';
import 'package:appointments/constants/global_variables.dart';
import 'package:appointments/features/auth/providers/auth_provider.dart';
import 'package:appointments/features/auth/widgets/background_image.dart';
import 'package:appointments/features/home/screens/home_screen.dart';
import 'package:appointments/features/tab/tabscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';

class ExpertForm extends StatefulWidget {
  static const routeName = '/expert-form';
  final String name;
  final String email;
  final String password;

  const ExpertForm(
      {Key? key,
      required this.name,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<ExpertForm> createState() => _ExpertFormState();
}

class _ExpertFormState extends State<ExpertForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  int? pickedCategory = 0;
  File? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackGroundImage(),
        AnimatedBackground(
          vsync: this,
          behaviour: RacingLinesBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                TitleWidget(text: 'TELL US MORE ABOUT YOURSELF'),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: image == null
                      ? const AssetImage('assets/images/an.png')
                      : FileImage(image!) as ImageProvider,
                ),
                TextButton.icon(
                    onPressed: () async {
                      final file = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (file == null) {
                        return;
                      }
                      setState(() {
                        image = File(file.path);
                      });
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Pick a profile image',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    preIcon: Icons.numbers,
                    textController: phoneController,
                    labelText: 'Phone Number',
                    pMargin: 10,
                    hmargin: 30),
                CustomTextField(
                    preIcon: Icons.location_on_outlined,
                    textController: addressController,
                    labelText: 'Address',
                    pMargin: 10,
                    hmargin: 30),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<int>(
                      borderRadius: BorderRadius.circular(15),
                      iconEnabledColor: GLobalVariables.baseColor,
                      dropdownColor: Colors.white,
                      value: pickedCategory,
                      items: const [
                        DropdownMenuItem<int>(
                            value: 0,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Medicine'),
                            )),
                        DropdownMenuItem<int>(
                            value: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('IT'),
                            )),
                      ],
                      onChanged: (value) {
                        setState(() {
                          pickedCategory = value!;
                        });
                      }),
                ),
                SizedBox(
                  height: 60,
                ),
                CustomButton(
                    function: () async {
                      setState(() {
                        isLoading = true;
                      });
                      if (await Provider.of<AuthProvider>(context,
                              listen: false)
                          .register(
                        widget.name,
                        widget.email,
                        widget.password,
                        'expert',
                        number: phoneController.text,
                        address: addressController.text,
                        image: image,
                        category: 'Medicine',
                      )) {
                        Navigator.pushNamed(context, TabsScreen.routeName);
                      }
                      setState(() {
                        isLoading = false;
                      });

                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MyTransition(
                      //         oldScreen: ExpertForm(), newScreen: TabsScreen()),
                      //     (route) => false);
                    },
                    height: 60,
                    width: 270,
                    text: 'Sign Up'),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
