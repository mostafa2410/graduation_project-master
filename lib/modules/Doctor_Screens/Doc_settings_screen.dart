import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/modules/owner-screen/owner_profile_screen/owner_profile_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';

import '../../shared/styles/colors.dart';
import 'doc_profile_screens/doc_profile_screen.dart';

class DocSettingsScreen extends StatelessWidget {
  const DocSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context, state) => {},
      builder: (context,state){
        double height=MediaQuery.of(context).size.height;
        return Column(
          children: [

            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ),


            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                              '${DoctorCubit.get(context).doctorModel!.image}',
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${DoctorCubit.get(context).doctorModel!.name}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,

                                ),),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  'See your profile',
                                  style: Theme.of(context).textTheme.caption!.copyWith(

                                    height: 1.4,
                                  )
                              )
                            ],

                          ),

                        ],
                      )

                    ],
                  ),
                ),
              ),
              onTap: (){
                navigateTo(context, DocProfileScreen());
              },
            ),
            myDivider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.dark_mode,
                            size: 40.0,
                          ),
                        ),
                        Text('Dark Mode',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.3,

                          ),),



                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            defaultButton(
                function: (){
                  // OwnerCubit.get(context).signOut(context: context);


                },
                text: 'Log out')


          ],
        );
      },
    );
  }
}
