class CategoryModel {
  final String title;
  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(
      title: "Femmes",
      image: "https://i.imgur.com/5M89G2P.png",
      subCategories: [CategoryModel(title: "All Clothing")]),
  CategoryModel(
      title: "Hommes",
      image: "https://i.imgur.com/UM3GdWg.png",
      subCategories: [CategoryModel(title: "All Clothing")]),
  CategoryModel(
      title: "Enfants",
      image: "https://i.imgur.com/Lp0D6k5.png",
      subCategories: [CategoryModel(title: "All Clothing")]),
  CategoryModel(
      title: "Accessoires",
      image: "https://i.imgur.com/3mSE5sN.png",
      subCategories: [CategoryModel(title: "All Clothing")]),
];

final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "En vente",
    svgSrc: "assets/icons/Sale.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
      CategoryModel(title: "Dresses"),
      CategoryModel(title: "Jeans"),
    ],
  ),
  CategoryModel(
    title: "Femme et Homme",
    svgSrc: "assets/icons/Man&Woman.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
    ],
  ),
  CategoryModel(
    title: "Enfants",
    svgSrc: "assets/icons/Child.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
      CategoryModel(title: "Coats & Jackets"),
    ],
  ),
  CategoryModel(
    title: "Accessoires",
    svgSrc: "assets/icons/Accessories.svg",
    subCategories: [
      CategoryModel(title: "All Clothing"),
      CategoryModel(title: "New In"),
    ],
  ),
];
