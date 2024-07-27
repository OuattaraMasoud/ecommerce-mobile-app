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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [],
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
                        await locator<ProductRepository>().createSubCategory({
                          "name": subCategoryNameController.text,
                        });
                      } catch (e) {
                      } finally {
                        locator<GlobalAppCubit>().stopLoading();
                      }
                    }
                  },
                  child: Text(
                    "Enregistrer la sous-catégorie",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
