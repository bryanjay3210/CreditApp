import 'package:credit_app/helper/image_helper.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key, this.height});
  final double? height;
  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: widget.height,
          ),
          GestureDetector(
            onTap: () async {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await GetIt.I<ImageHelper>()
                                  .pickImage()
                                  .then((res) async {
                                await GetIt.I<ImageHelper>()
                                    .cropImage(file: res!)
                                    .then((value) async {
                                  context
                                      .read<RegisterCubit>()
                                      .setImage(
                                          base64Image:
                                              await value!.readAsBytes())
                                      .then((value) => context.pop());
                                });
                              });
                            },
                            icon: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.camera_on_rectangle_fill),
                                Text('Galerry')
                              ],
                            )),
                        IconButton(
                            onPressed: () async {
                              await GetIt.I<ImageHelper>()
                                  .pickImage(source: ImageSource.camera)
                                  .then((res) async {
                                await GetIt.I<ImageHelper>()
                                    .cropImage(file: res!)
                                    .then((value) async {
                                  context
                                      .read<RegisterCubit>()
                                      .setImage(
                                          base64Image:
                                              await value!.readAsBytes())
                                      .then((value) => context.pop());
                                });
                              });
                            },
                            icon: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.camera_fill),
                                Text('Cammera')
                              ],
                            )),
                      ],
                    ),
                  );
                },
              );
            },
            child: FittedBox(
              fit: BoxFit.contain,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  if (state.base64Image == null) {
                    return CircleAvatar(
                      radius: 40,
                      child: Icon(CupertinoIcons.person_alt,
                          color: kPrimaryColor, size: 40),
                    );
                  }
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.memory(state.base64Image!).image,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
