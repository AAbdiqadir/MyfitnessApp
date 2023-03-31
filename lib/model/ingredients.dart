
class Ingredient {
  List <String>  products;
  String id;

  Ingredient({
    required this.id,
    required this.products
});

  Map<String,dynamic>toJon()=>{
    'products': products,
    'id': id,
  };
  Ingredient.fromSnapshot(snapshot)
      : products = snapshot.data()["products"],
        id = snapshot.data()["id"];

}