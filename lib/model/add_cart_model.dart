class AddCartModel {
  String? id;
  String? quantity;

  AddCartModel({
    this.id,
    this.quantity,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
        id: json["id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
      };
}
