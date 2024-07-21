import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_project/components/skleton/skelton.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/global_app/cubit/global_app_cubit.dart';
import 'package:e_commerce_project/screens/admin/categories/model/category_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewSubCategoryPage extends StatefulWidget {
  static const routeName = "AddNewSubCategoryPageView";
  const AddNewSubCategoryPage({super.key});

  @override
  State<AddNewSubCategoryPage> createState() => _AddNewSubCategoryPageState();
}

class _AddNewSubCategoryPageState extends State<AddNewSubCategoryPage> {
  TextEditingController subCategoryNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  List<Widget> imageFormFields = [];
  List<CategoryModel> _categories = [];
  String selectedCategoryName = "";
  String selectedCategoryID = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _initOperationItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        automaticallyImplyLeading: true,
        leadingWidth: 0,
        centerTitle: true,
        title: const Text(
          'Ajouter une sous-catégorie',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            child: _categories.isEmpty
                ? Column(
                    children: [
                      Skeleton(
                        height: 50.h,
                        width: 1.sw,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Skeleton(
                        height: 50.h,
                        width: 1.sw,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Skeleton(
                        height: 50.h,
                        width: 1.sw,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Catégorie',
                                    style: TextStyle(fontSize: 16.sp)),
                                DropdownButton2<String>(
                                  buttonStyleData: ButtonStyleData(
                                    width: 0.9.sw,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xFF7B61FF),
                                      ),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    height: 40.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
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
                                      selectedCategoryName = value ?? "";
                                    });
                                  },
                                  items: _categories.map((category) {
                                    return DropdownMenuItem(
                                      value: category.name,
                                      child: Text(
                                        category.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: subCategoryNameController,
                        validator: productNameValidator.call,
                        onSaved: (name) {
                          // Email
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Nom de la sous-catégorie",
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            locator<GlobalAppCubit>().startLoading();
                            try {
                              await locator<ProductRepository>()
                                  .createSubCategory({
                                "name": subCategoryNameController.text,
                                "categoryId": selectedCategoryID,
                              });
                            } catch (e) {
                            } finally {
                              locator<GlobalAppCubit>().stopLoading();
                            }
                          }
                        },
                        child: Text(
                          "Enregistrer la sous-catégorie",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _initOperationItems() async {
    try {
      final data = await locator<ProductRepository>().getAllCategories();

      setState(() {
        _categories = List<CategoryModel>.from(
          data.map((item) => CategoryModel(
              id: item["id"]!,
              name: item["name"]!,
              createdAt: item["createdAt"]!,
              updatedAt: item["updatedAt"]!,
              subCategories: List<SubCategoryModel>.from(
                  item["subCategories"]!.map((item) => SubCategoryModel(
                        createdAt: item["createdAt"],
                        updatedAt: item['updatedAt'],
                        id: item["id"]!,
                        name: item["name"],
                      ))))),
        );
        if (_categories.isNotEmpty) {
          selectedCategoryName = _categories[0].name;
          selectedCategoryID = _categories[0].id!.replaceAll("category_", "");
        }
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
