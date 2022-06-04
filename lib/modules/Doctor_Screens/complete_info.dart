
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/layouts/doc_home_layout/doc_home_layout.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:graduation_project/shared/styles/icon_broken.dart';

import '../../shared/component/components.dart';

class DoctorCompleteInfo extends StatelessWidget {
  final String? docId;
  DoctorCompleteInfo({this.docId});
  var DoctorName = TextEditingController();
  var DoctorAddress = TextEditingController();
  var RaqamQuamyDoctor = TextEditingController();



  @override
  Widget build(BuildContext context) {
    if(dId==null){
      dId=docId;
    }
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (BuildContext context, state) {

        if (state is UpdateDocDataSuccessfulState) {
          CachHelper.saveData(key: 'done', value: 1).then((value) {
            navigateAndFinish(context, DocHomeScreenLayout());
          });

        }
      },
      builder: (BuildContext context, state) {

        var height=MediaQuery.of(context).size.height;


        var cubit=DoctorCubit.get(context);

        cubit.getDocData();
      
        return Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.1,
                  ),
                  InkWell(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 65.0,
                          backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage:cubit.docImage==null ?
                            NetworkImage('https://media.istockphoto.com/photos/veterinarian-examining-the-horse-picture-id154954791')
                                :FileImage(cubit.docImage!)as ImageProvider,
                          ),
                        ),
                        Icon(Icons.photo_camera),
                      ],
                    ),
                    onTap: (){
                      cubit.getDocImage();
                    },
                  ),

                  SizedBox(
                    height: height*0.01,
                  ),


                  defaultFormField(
                      controller: DoctorName,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'يجب ادخال البيانات ';
                        }
                      },
                      label: 'الاسم',
                      prefixIcon: Icons.person),
                  SizedBox(
                    height: height*0.01,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: DoctorAddress,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'العنوان',
                        prefixIcon: Icons.location_on_sharp),
                  ),
                  SizedBox(
                    height: height*0.01,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: RaqamQuamyDoctor,
                        type: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'رقم قومي',
                        prefixIcon: Icons.perm_identity),
                  ),


                  SizedBox(
                    height: height*0.01,
                  ),
                  Expanded(child: SizedBox(),),

                  defaultButton2(
                    function: () {
                      cubit.uploadDocImage(
                        name: DoctorName.text,
                          ssn: RaqamQuamyDoctor.text,
                          address:DoctorAddress.text);

                    },
                    text: 'Save',
                    background: defColorApp,
                    height: 50.0,
                    width: 200.0,
                    icon: Icons.done,
                  ),


                ],
              ),
            ));
      },
    );
  }
}
