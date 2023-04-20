
class Ingredient {
  List<dynamic>  products;
  String id;
  String instruction;

  Ingredient({
    required this.id,
    required this.products,
    required this.instruction
});

  Map<String,dynamic>toJon()=>{
    'products': products,
    'id': id,
    "instruction":instruction
  };
  Ingredient.fromSnapshot(snapshot)
      : products = snapshot.data()["products"],
        id = snapshot.data()["id"],
        instruction = snapshot.data()["instruction"];


}