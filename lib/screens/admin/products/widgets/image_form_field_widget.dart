import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_project/common/constant.dart';
import 'package:e_commerce_project/screens/admin/products/views/image_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageFormField extends FormField<XFile> {
  ImageFormField({
    String? imageName,
    double? imageFormFieldMinHeight,
    double? imageFormFieldMaxHeight,
    double? imageFormFieldMinWidth,
    double? imageFormFieldMaxWidth,
    Key? key,
    FormFieldSetter<XFile>? onSaved,
    FormFieldSetter<XFile>? onChanged,
    required FormFieldValidator<XFile> validator,
    XFile? initialValue,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            builder: (FormFieldState<XFile> state) {
              return ChangeNotifierProvider(
                create: (_) => CompleteProfileController(),
                child: Consumer<CompleteProfileController>(
                    builder: (context, provider, child) {
                  return Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          initialValue == null
                              ? ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: imageFormFieldMinWidth ?? 0.25.sw,
                                    minHeight: imageFormFieldMinHeight ?? 75.h,
                                    maxHeight: imageFormFieldMaxHeight ??
                                        double.infinity,
                                    maxWidth: imageFormFieldMaxWidth ??
                                        double.infinity,
                                  ),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: WidgetStateProperty.all(5),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: state.hasError
                                                ? const BorderSide(
                                                    color: Colors.red)
                                                : BorderSide.none,
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.grey[350]
                                              : Colors.grey[800],
                                        ),
                                        padding: WidgetStateProperty.all(
                                            EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        )),
                                      ),
                                      onPressed: () async {
                                        // final picker = ImagePicker();
                                        // final pickedImage =
                                        //     await picker.pickImage(
                                        //         imageQuality: 30,
                                        //         source: ImageSource.camera);
                                        // if (onChanged != null) {
                                        //   onChanged(pickedImage);
                                        // }
                                        // state.didChange(pickedImage);
                                        provider.pickImage(
                                          context,
                                          onChanged,
                                          state,
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.photo_camera,
                                            size: 48.h,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            imageName ?? 'Photo',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                            ),
                                          )
                                        ],
                                      )),
                                )
                              : Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        provider.pickImage(
                                            context, onChanged, state);
                                      },
                                      child: Material(
                                        borderRadius: BorderRadius.circular(20),
                                        child: InkWell(
                                            child: Image.file(
                                          File(provider.image!.path),
                                          fit: BoxFit.cover,
                                          height: 100.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                          if (state.hasError) ...[
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  AutoSizeText(
                                    state.errorText!,
                                    style: TextStyle(
                                      color: Colors.red[900],
                                      fontSize: 13.0.sp,
                                    ),
                                    maxLines: 2,
                                    minFontSize: 11,
                                  ),
                                ],
                              ),
                            )
                          ]
                        ],
                      );
                    },
                  );
                }),
              );
            });
}
