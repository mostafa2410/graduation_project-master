import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../layouts/home_layout/cubit/cubit.dart';
import '../../../layouts/home_layout/cubit/states.dart';
import '../../../shared/component/components.dart';
import '../../../shared/styles/icon_broken.dart';

class OwnerEditProfileScreen extends StatelessWidget {
  const OwnerEditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var ownerModel = OwnerCubit.get(context).ownerModel;
        var profileImage = OwnerCubit.get(context).profileImage;
        var coverImage = OwnerCubit.get(context).coverImage;
        var nameController = TextEditingController();
        var phoneController = TextEditingController();
        var bioController = TextEditingController();

        if (ownerModel != null) {
          nameController.text = ownerModel.studName;
          bioController.text = ownerModel.bio;
          phoneController.text = ownerModel.phone;
        }
        return Scaffold(
          appBar: AppBar(title: Text('Edit Profile'), actions: [
            defaultTextButton(
                text: 'UPDATE',
                pressedFunction: () {
                  OwnerCubit.get(context).updateOwner(
                      studName: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                }),
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is UserUpdateLoadingState)
                    LinearProgressIndicator(),
                  if (state is UserUpdateLoadingState)
                    SizedBox(
                      height: 10.0,
                    ),
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              child: Container(
                                height: 140.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0)),
                                    image: DecorationImage(
                                      image: coverImage == null
                                          ? NetworkImage('${ownerModel?.cover}')
                                          : FileImage(coverImage)
                                      as ImageProvider,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            IconButton(
                                onPressed: () {
                                  OwnerCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${ownerModel?.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  OwnerCubit.get(context).getProfileImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (OwnerCubit.get(context).profileImage != null ||
                      OwnerCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (OwnerCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      OwnerCubit.get(context)
                                          .uploadProfileImage(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text, context: context);
                                    },
                                    text: 'Upload Profile'),
                                if (state is OwnerUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is OwnerUpdateLoadingState)
                                  LinearProgressIndicator()
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 8.0,
                        ),
                        if (OwnerCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      OwnerCubit.get(context).uploadCoverImage(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text, context: context);
                                    },
                                    text: 'Upload Cover'),
                                if (state is OwnerUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is OwnerUpdateLoadingState)
                                  LinearProgressIndicator()
                              ],
                            ),
                          ),
                      ],
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }
                      },
                      label: 'Name',
                      prefixIcon: IconBroken.User),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'bio must not be empty';
                        }
                      },
                      label: 'Bio',
                      prefixIcon: IconBroken.Info_Circle),
                  SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'phone must not be empty';
                        }
                      },
                      label: 'Phone',
                      prefixIcon: IconBroken.Call)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
