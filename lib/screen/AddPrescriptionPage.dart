import 'package:flutter/material.dart';

import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/Navigators.dart';
import '../constant/addButton.dart';
import 'Camera/camera_screen.dart';

class AddPrescriptionPage extends StatefulWidget {
  const AddPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<AddPrescriptionPage> createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        index: 2,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: addButton('أضف صورة الروشته أو المنتج الذي تريده', Icons.camera_alt,35,80,double.infinity,16,(){
            pushNavigator(CameraScreen(), context);
          }, context),
        ),
      ),
    );
  }
}
