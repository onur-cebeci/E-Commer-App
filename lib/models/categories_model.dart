class Categories {
  Categories({
    required this.icon,
    required this.categoryName,
    required this.categoryID,
  });
  final String icon;
  final String categoryName;
  final int categoryID;
}

final categoryList = <Categories>[
  Categories(
      categoryName: 'Sheer', categoryID: 1, icon: 'assets/icons/sheer.png'),
  Categories(
      categoryName: 'Seat', categoryID: 2, icon: 'assets/icons/sofa.png'),
  Categories(
      categoryName: 'Cushion', categoryID: 3, icon: 'assets/icons/cushion.png'),
  Categories(
      categoryName: 'Wall Clock',
      categoryID: 4,
      icon: 'assets/icons/clock.png'),
  Categories(
      categoryName: 'Coffee Table',
      categoryID: 5,
      icon: 'assets/icons/circle-table.png'),
  Categories(
      categoryName: 'Vase', categoryID: 6, icon: 'assets/icons/vase.png'),
  Categories(
      categoryName: 'Plant Stand',
      categoryID: 7,
      icon: 'assets/icons/plant-stand.png'),
  Categories(
      categoryName: 'Picture', categoryID: 8, icon: 'assets/icons/picture.png'),
  Categories(
      categoryName: 'Board', categoryID: 9, icon: 'assets/icons/board.png'),
  Categories(
      categoryName: 'Office Chair',
      categoryID: 10,
      icon: 'assets/icons/chair.png'),
  Categories(
      categoryName: 'Cabinet',
      categoryID: 11,
      icon: 'assets/icons/cabinet.png'),
  Categories(
      categoryName: 'Table', categoryID: 12, icon: 'assets/icons/table.png'),
];
