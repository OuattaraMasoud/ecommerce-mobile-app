import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/global_app/cubit/global_app_cubit.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminAddNewCategoryPage extends StatefulWidget {
  static const routeName = "AdminAddNewCategoryPageView";
  const AdminAddNewCategoryPage({super.key});

  @override
  State<AdminAddNewCategoryPage> createState() =>
      _AdminAddNewCategoryPageState();
}

class _AdminAddNewCategoryPageState extends State<AdminAddNewCategoryPage> {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  List<Widget> imageFormFields = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          'Ajouter une catégorie',
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
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 50.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: categoryNameController,
                  validator: productNameValidator.call,
                  onSaved: (name) {
                    // Email
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Nom de la catégorie",
                  ),
                ),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      locator<GlobalAppCubit>().startLoading();
                      try {
                        await locator<ProductRepository>().createCategory({
                          "name": categoryNameController.text,
                        });
                      } catch (e) {
                      } finally {
                        locator<GlobalAppCubit>().stopLoading();
                      }
                    }
                  },
                  child: Text(
                    "Enregistrer le categorie",
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
