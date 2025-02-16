import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/global_app/cubit/global_app_cubit.dart';
import 'package:e_commerce_project/screens/admin/categories/model/category_model.dart';
import 'package:e_commerce_project/screens/admin/products/file_picker_blocs/file_picker_bloc.dart';
import 'package:e_commerce_project/screens/admin/products/widgets/image_form_field_widget.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:e_commerce_project/theme/theme.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'image_form_controller.dart';

class AddNewProductPage extends StatefulWidget {
  static const routeName = "AddNewProductPageView";
  const AddNewProductPage({super.key});

  @override
  State<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productBrandController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  List<Widget> imageFormFields = [];
  List<CategoryModel> _categories = [];
  List<SubCategoryModel> _subCategories = [];
  String selectedSubCategoryName = " ";
  String selectedCategoryName = "";
  String selectedCategoryID = " ";
  String selectedSubCategoryID = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _initOperationItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CompleteProfileController(),
        child: Consumer<CompleteProfileController>(
            builder: (context, provider, child) {
          return BlocProvider(
            create: (context) =>
                FilePickerBloc(FilePickerState(pickedImage: XFile(""))),
            child: BlocBuilder<FilePickerBloc, FilePickerState>(
              builder: (context, filePickerState) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    leading: const SizedBox(),
                    automaticallyImplyLeading: true,
                    leadingWidth: 0,
                    centerTitle: true,
                    title: const Text(
                      'Ajouter un produit',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/Notification.svg",
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Catégorie',
                                            style: TextStyle(fontSize: 16.sp)),
                                        DropdownButton2<String>(
                                          buttonStyleData: ButtonStyleData(
                                            width: 0.4.sw,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color(0xFF7B61FF)),
                                            ),
                                            elevation: 1,
                                          ),
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                          menuItemStyleData: MenuItemStyleData(
                                            height: 40.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                          ),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color,
                                          ),
                                          value: selectedCategoryName,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCategoryName =
                                                  value ?? "";
                                              CategoryModel selectedCategory =
                                                  _categories.firstWhere(
                                                (category) =>
                                                    category.categoryName ==
                                                    value,
                                                orElse: () => CategoryModel(
                                                    categoryId: "",
                                                    categoryName: "",
                                                    categoryCreatedAt: '',
                                                    categoryUpdatedAt: ''),
                                              );

                                              // Mettez à jour selectedCategoryID avec l'ID trouvé
                                              selectedCategoryID =
                                                  selectedCategory.categoryId ??
                                                      "";
                                            });
                                          },
                                          items: _categories.map((category) {
                                            return DropdownMenuItem(
                                              value: category
                                                  .categoryName, // Utilisez l'id comme valeur
                                              child: Text(
                                                category.categoryName,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Sous-catégorie',
                                            style: TextStyle(fontSize: 16.sp)),
                                        DropdownButton2<String>(
                                          buttonStyleData: ButtonStyleData(
                                            width: 0.66.sw,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color(0xFF7B61FF)),
                                            ),
                                            elevation: 2,
                                          ),
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                          menuItemStyleData: MenuItemStyleData(
                                            height: 40.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14.w),
                                          ),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color,
                                          ),
                                          value: selectedSubCategoryName,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedSubCategoryName =
                                                  value ?? "";
                                              // Recherchez l'objet SubCategoryModel correspondant
                                              SubCategoryModel
                                                  selectedSubCategory =
                                                  _subCategories.firstWhere(
                                                (subCategory) =>
                                                    subCategory
                                                        .subCategoryName ==
                                                    value,
                                                orElse: () => SubCategoryModel(
                                                    subCategoryId: "",
                                                    subCategoryName: "",
                                                    subCategoryCreatedAt: '',
                                                    subCategoryUpdatedAt: ''),
                                              );

                                              // Mettez à jour selectedSubCategoryID avec l'ID trouvé
                                              selectedSubCategoryID =
                                                  selectedSubCategory
                                                          .subCategoryId ??
                                                      "";
                                            });
                                          },
                                          items:
                                              _subCategories.map((subCategory) {
                                            return DropdownMenuItem(
                                              value: subCategory
                                                  .subCategoryName, // Utilisez l'id comme valeur
                                              child: Text(
                                                subCategory.subCategoryName,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: productNameController,
                              validator: productNameValidator.call,
                              onSaved: (name) {
                                // Email
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Nom du produit",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              controller: productBrandController,
                              validator: productBrandValidator.call,
                              onSaved: (name) {
                                // Email
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: "Marque du produit",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              controller: productPriceController,
                              onSaved: (emal) {
                                // Email
                              },
                              validator: productPriceValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Prix du produit",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              maxLines: 5,
                              controller: productDescriptionController,
                              onSaved: (emal) {
                                // Email
                              },
                              validator: productDescriptionValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                hintText: "Description du produit",
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            BlocProvider(
                              create: (context) => FilePickerBloc(
                                  FilePickerState(pickedImage: XFile(""))),
                              child: ImageFormField(
                                initialValue: filePickerState.pickedImage,
                                imageName: "Image du produit",
                                validator: (value) => filePickerState
                                            .pickedImage ==
                                        null
                                    ? 'Vous devez ajouter une image au produits.'
                                    : null,
                                onChanged: (image) => image != null
                                    ? context.read<FilePickerBloc>().add(
                                          AddPictureEvent(pickedImage: image),
                                        )
                                    : null,
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            ElevatedButton(
                              onPressed: () async {
                                if (_subCategories.isNotEmpty &&
                                    _subCategories.isNotEmpty &&
                                    _formKey.currentState!.validate()) {
                                  locator<GlobalAppCubit>().startLoading();
                                  try {
                                    var imageToUploadUrl =
                                        await provider.uploadImage(
                                            filePickerState.pickedImage);

                                    if (imageToUploadUrl != null &&
                                        imageToUploadUrl.isNotEmpty) {
                                      await locator<ProductRepository>()
                                          .createProduct({
                                        "categoryId": selectedCategoryID
                                            .replaceAll("category_", ""),
                                        "subCategoryId": selectedSubCategoryID
                                            .replaceAll("subCategory_", ""),
                                        "name": productNameController.text,
                                        "brand": productBrandController.text,
                                        "price": double.parse(
                                            productPriceController.text),
                                        "description":
                                            productDescriptionController.text,
                                        "imagesUrl": imageToUploadUrl,
                                      });
                                    }
                                  } catch (e) {
                                  } finally {
                                    locator<GlobalAppCubit>().stopLoading();
                                  }
                                }
                              },
                              child: Text(
                                "Enregistrer le produit",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }

  Future<void> _initOperationItems() async {
    try {
      final categoriesData =
          await locator<ProductRepository>().getAllCategories();
      final subCategoriesData =
          await locator<ProductRepository>().getAllSubCategories();

      setState(() {
        _categories =
            List<Map<String, dynamic>>.from(categoriesData).map((category) {
          return CategoryModel.fromJson(category);
        }).toList();

        _subCategories = List<Map<String, dynamic>>.from(subCategoriesData)
            .map((subCategory) {
          return SubCategoryModel.fromJson(subCategory);
        }).toList();

        if (_subCategories.isNotEmpty && _subCategories.isNotEmpty) {
          selectedCategoryName = _categories[0].categoryName;
          selectedCategoryID =
              _categories[0].categoryId!.replaceAll("category_", "");

          selectedSubCategoryID =
              _subCategories[0].subCategoryId!.replaceAll("subCategory_", "");
          selectedSubCategoryName = _subCategories[0].subCategoryName;
        }
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
