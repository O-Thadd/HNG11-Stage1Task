class ShoppingItem {
  final String name;
  bool selected;

  ShoppingItem(this.name, this.selected);
  
  void alterSelection(){
    selected = !selected;
  }
}


//dummy data
final shoppingItems = [
  ShoppingItem('Brazil nuts', false),
  ShoppingItem('Monkfish', false),
  ShoppingItem('Rabbits', false),
  ShoppingItem('Coconut oil', false),
  ShoppingItem('Aragula', false),
  ShoppingItem('Turkey', false),
  ShoppingItem('Hash browns', false),
  ShoppingItem('Marsala wine', false),
  ShoppingItem('Tuna', false),
  ShoppingItem('Vanilla ice cream', false),
  ShoppingItem('Almond milk', false),
  ShoppingItem('Canned chickpeas', false),
  ShoppingItem('Cheese', false),
  ShoppingItem('Gouda turmeric', false),
  ShoppingItem('Peppers', false),
  ShoppingItem('Jasmine rice', false),
  ShoppingItem('Dark chocolate', false),
];