class CartListModel {
  int? id;
  int? customerId;
  String? cartGroupId;
  int? productId;
  String? productType;
  dynamic digitalProductType;
  dynamic color;
  Choices? choices;
  Variations? variations;
  String? variant;
  int? quantity;
  int? price;
  double? tax;
  double? discount;
  String? slug;
  String? name;
  String? thumbnail;
  int? sellerId;
  String? sellerIs;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shopInfo;
  int? shippingCost;
  String? shippingType;
  Product? product;

  CartListModel({
    this.id,
    this.customerId,
    this.cartGroupId,
    this.productId,
    this.productType,
    this.digitalProductType,
    this.color,
    this.choices,
    this.variations,
    this.variant,
    this.quantity,
    this.price,
    this.tax,
    this.discount,
    this.slug,
    this.name,
    this.thumbnail,
    this.sellerId,
    this.sellerIs,
    this.createdAt,
    this.updatedAt,
    this.shopInfo,
    this.shippingCost,
    this.shippingType,
    this.product,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        id: json["id"],
        customerId: json["customer_id"],
        cartGroupId: json["cart_group_id"],
        productId: json["product_id"],
        productType: json["product_type"],
        digitalProductType: json["digital_product_type"],
        color: json["color"],
        choices:
            json["choices"] == null ? null : Choices.fromJson(json["choices"]),
        variations: json["variations"] == null
            ? null
            : Variations.fromJson(json["variations"]),
        variant: json["variant"],
        quantity: json["quantity"],
        price: json["price"],
        tax: json["tax"]?.toDouble(),
        discount: json["discount"]?.toDouble(),
        slug: json["slug"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        sellerId: json["seller_id"],
        sellerIs: json["seller_is"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        shopInfo: json["shop_info"],
        shippingCost: json["shipping_cost"],
        shippingType: json["shipping_type"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "cart_group_id": cartGroupId,
        "product_id": productId,
        "product_type": productType,
        "digital_product_type": digitalProductType,
        "color": color,
        "choices": choices?.toJson(),
        "variations": variations?.toJson(),
        "variant": variant,
        "quantity": quantity,
        "price": price,
        "tax": tax,
        "discount": discount,
        "slug": slug,
        "name": name,
        "thumbnail": thumbnail,
        "seller_id": sellerId,
        "seller_is": sellerIs,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shop_info": shopInfo,
        "shipping_cost": shippingCost,
        "shipping_type": shippingType,
        "product": product?.toJson(),
      };
}

class Choices {
  dynamic choice2;

  Choices({
    this.choice2,
  });

  factory Choices.fromJson(Map<String, dynamic> json) => Choices(
        choice2: json["choice_2"],
      );

  Map<String, dynamic> toJson() => {
        "choice_2": choice2,
      };
}

class Product {
  int? id;
  String? name;
  String? slug;
  int? currentStock;
  int? minimumOrderQty;
  int? reviewsCount;
  int? totalCurrentStock;
  List<dynamic>? translations;
  List<dynamic>? reviews;

  Product({
    this.id,
    this.name,
    this.slug,
    this.currentStock,
    this.minimumOrderQty,
    this.reviewsCount,
    this.totalCurrentStock,
    this.translations,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        reviewsCount: json["reviews_count"],
        totalCurrentStock: json["total_current_stock"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "reviews_count": reviewsCount,
        "total_current_stock": totalCurrentStock,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
      };
}

class Variations {
  dynamic size;

  Variations({
    this.size,
  });

  factory Variations.fromJson(Map<String, dynamic> json) => Variations(
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
      };
}
