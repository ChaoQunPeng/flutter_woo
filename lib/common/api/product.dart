/*
 * @Author: PengChaoQun 1152684231@qq.com
 * @Date: 2024-06-10 10:28:39
 * @LastEditors: PengChaoQun 1152684231@qq.com
 * @LastEditTime: 2024-06-11 18:11:31
 * @FilePath: /flutter_woo_commerce_getx_learn/lib/common/api/product.dart
 * @Description: 
 */
import '../index.dart';

/// 商品 api
class ProductApi {
  /// 分类列表
  static Future<List<CategoryModel>> categories() async {
    var res = await WPHttpService.to.get(
      '/products/categories',
    );

    List<CategoryModel> categories = [];
    for (var item in res.data) {
      categories.add(CategoryModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return categories;
  }

  /// 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await WPHttpService.to.get(
      '/products',
      params: req?.toJson(),
    );

    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }

  /// 商品详情
  static Future<ProductModel> productDetail(int? id) async {
    var res = await WPHttpService.to.get(
      '/products/$id',
    );
    return ProductModel.fromJson(res.data);
  }

  /// 属性列表
  /// id 1 颜色 2 尺寸
  static Future<List<AttributeModel>> attributes(int id) async {
    var res = await WPHttpService.to.get(
      '/products/attributes/$id/terms',
    );

    List<AttributeModel> attributes = [];
    for (var item in res.data) {
      attributes.add(AttributeModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    attributes.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return attributes;
  }

  /// 评论列表
  static Future<List<ReviewModel>> reviews(ReviewsReq? req) async {
    var res = await WPHttpService.to.get(
      '/products/reviews',
      params: req?.toJson(),
    );

    var list = [
      {
        "id": 4,
        "date_created": "sunt Excepteur",
        "date_created_gmt": "ullamco velit Ut magna",
        "product_id": 95,
        "status": "deserunt veniam",
        "reviewer": "consequat et tempor ut",
        "reviewer_email": "y.pldjpk@qq.com",
        "review": "velit in commodo",
        "rating": 40,
        "verified": false,
        "reviewer_avatar_urls": {
          "24": "cillum in",
          "48": "labore deserunt non",
          "96": "laboris sed tempor Excepteur"
        },
        "_links": {
          "self": [
            {"href": "aliquip dolor"}
          ],
          "collection": [
            {"href": "aute sed mollit esse Lorem"}
          ],
          "up": [
            {"href": "mollit proident culpa"}
          ],
          "reviewer": [
            {"embeddable": true, "href": "mollit"}
          ]
        }
      }
    ];

    List<ReviewModel> reviews = [];
    for (var item in list) {
      reviews.add(ReviewModel.fromJson(item));
    }
    return reviews;
  }
}

/// 评论查询请求
class ReviewsReq {
  final int? page;
  final int? prePage;
  final int? product;

  ReviewsReq({
    this.page,
    this.prePage,
    this.product,
  });

  Map<String, dynamic> toJson() => {
        'page': page ?? 1,
        'pre_page': prePage ?? 10,
        'product': product ?? 0,
      };
}
