import 'package:credit_app/enum/gender.dart';
import 'package:credit_app/helper/image_helper.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/creditor_information/cubit/creditor_information_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreditorInformation extends StatefulWidget {
  const CreditorInformation({super.key});

  @override
  State<CreditorInformation> createState() => _CreditorInformationState();
}

class _CreditorInformationState extends State<CreditorInformation> {
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController contactNoCtrl = TextEditingController();
  final TextEditingController emailAddressCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreditorInformationCubit>().initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreditorInformationCubit, CreditorInformationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                expandedHeight: 200,
                backgroundColor: kSecondaryColor,
                flexibleSpace: GestureDetector(
                  onTap: () {
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
                                            .read<CreditorInformationCubit>()
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
                                      Icon(CupertinoIcons
                                          .camera_on_rectangle_fill),
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
                                            .read<CreditorInformationCubit>()
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
                  child: FlexibleSpaceBar(
                    title: state.base64Image == null
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            decoration:
                                const BoxDecoration(color: Colors.blueGrey),
                            child: Text(
                              'No Photo',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        : const SizedBox(),
                    background: state.base64Image == null
                        ? Image.asset('assets/no_photo.png')
                        : Image.memory(state.base64Image!, fit: BoxFit.cover),
                  ),
                ),
              ),
              SliverList(
                delegate:
                    SliverChildBuilderDelegate(childCount: 1, (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Creditor Information',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: fullNameCtrl,
                              decoration: const InputDecoration(
                                  hintText: 'Name',
                                  prefixIcon: Icon(CupertinoIcons.person_alt)),
                              validator: (value) =>
                                  value!.isEmpty ? 'Name is required' : null,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Gender',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(Gender.Male.name),
                                  leading: Radio(
                                    value: Gender.Male,
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      context
                                          .read<CreditorInformationCubit>()
                                          .changeGender(value!);
                                    },
                                  ),
                                ),
                              )
                            ]),
                            Row(children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(Gender.Female.name),
                                  leading: Radio(
                                    value: Gender.Female,
                                    groupValue: state.gender,
                                    onChanged: (value) {
                                      context
                                          .read<CreditorInformationCubit>()
                                          .changeGender(value!);
                                    },
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: addressCtrl,
                              decoration: const InputDecoration(
                                  hintText: 'Address',
                                  prefixIcon:
                                      Icon(CupertinoIcons.location_solid)),
                              validator: (value) =>
                                  value!.isEmpty ? 'Address is required' : null,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: contactNoCtrl,
                              decoration: const InputDecoration(
                                  hintText: 'Contact #',
                                  prefixIcon: Icon(CupertinoIcons.phone_solid)),
                              validator: (value) => value!.isEmpty
                                  ? 'Contact # is required'
                                  : null,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: emailAddressCtrl,
                              decoration: const InputDecoration(
                                  hintText: 'Email Address',
                                  prefixIcon:
                                      Icon(CupertinoIcons.location_solid)),
                              validator: (value) => value!.isEmpty
                                  ? 'Email Address is required'
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            state.isLoading
                                ? Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                            color: kPrimaryColor, size: 40),
                                  )
                                : Container(
                                    width: double.infinity,
                                    color: kPrimaryColor,
                                    child: TextButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<
                                                    CreditorInformationCubit>()
                                                .addCreditor(
                                                    fullname: fullNameCtrl.text,
                                                    address: addressCtrl.text,
                                                    contactNo:
                                                        contactNoCtrl.text,
                                                    emailAddress:
                                                        emailAddressCtrl.text,
                                                    context: context);
                                          }
                                        },
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              color: kPrimaryColor,
                              child: TextButton(
                                  onPressed: () => context.pop(),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          );
        },
      ),
    );
  }
}
