class HomeResponse {
  final bool success;
  final String status;
  final String message;
  final HomeData data;

  HomeResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      success: json['success'] ?? false,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: HomeData.fromJson(json['data'] ?? {}),
    );
  }
}

class HomeData {
  final String deliveryAddress;
  final int supercoinBalance;
  final SearchData search;
  final List<ServiceTab> serviceTabs;
  final List<Category> categories;
  final List<HomeBanner> banners;
  final List<AdProduct> adProducts;
  final List<SuggestedProduct> suggestedForYou;
  final List<LiveStream> liveStreams;
  final List<BottomNavItem> bottomNav;

  HomeData({
    required this.deliveryAddress,
    required this.supercoinBalance,
    required this.search,
    required this.serviceTabs,
    required this.categories,
    required this.banners,
    required this.adProducts,
    required this.suggestedForYou,
    required this.liveStreams,
    required this.bottomNav,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      deliveryAddress: json['delivery_address'] ?? '',
      supercoinBalance: json['supercoin_balance'] ?? 0,
      search: SearchData.fromJson(json['search'] ?? {}),
      serviceTabs: (json['service_tabs'] as List? ?? [])
          .map((item) => ServiceTab.fromJson(item))
          .toList(),
      categories: (json['categories'] as List? ?? [])
          .map((item) => Category.fromJson(item))
          .toList(),
      banners: (json['banners'] as List? ?? [])
          .map((item) => HomeBanner.fromJson(item))
          .toList(),
      adProducts: (json['ad_products'] as List? ?? [])
          .map((item) => AdProduct.fromJson(item))
          .toList(),
      suggestedForYou: (json['suggested_for_you'] as List? ?? [])
          .map((item) => SuggestedProduct.fromJson(item))
          .toList(),
      liveStreams: (json['live_streams'] as List? ?? [])
          .map((item) => LiveStream.fromJson(item))
          .toList(),
      bottomNav: (json['bottom_nav'] as List? ?? [])
          .map((item) => BottomNavItem.fromJson(item))
          .toList(),
    );
  }
}

class SearchData {
  final String placeholder;
  final bool voiceEnabled;
  final bool scanEnabled;

  SearchData({
    required this.placeholder,
    required this.voiceEnabled,
    required this.scanEnabled,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      placeholder: json['placeholder'] ?? '',
      voiceEnabled: json['voice_enabled'] ?? false,
      scanEnabled: json['scan_enabled'] ?? false,
    );
  }
}

class ServiceTab {
  final int id;
  final String name;
  final String slug;
  final String? badgeText;
  final bool isSelected;
  final String? iconUrl;

  ServiceTab({
    required this.id,
    required this.name,
    required this.slug,
    this.badgeText,
    required this.isSelected,
    this.iconUrl,
  });

  factory ServiceTab.fromJson(Map<String, dynamic> json) {
    return ServiceTab(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      badgeText: json['badge_text'],
      isSelected: json['is_selected'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;
  final bool isSelected;
  final String? iconUrl;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.isSelected,
    this.iconUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      isSelected: json['is_selected'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}

class HomeBanner {
  final int id;
  final String? tagText;
  final String title;
  final String? subtitle;
  final String? offerText;
  final String? brandLabel;
  final String? termsText;
  final String? redirectUrl;
  final String? imageUrl;

  HomeBanner({
    required this.id,
    this.tagText,
    required this.title,
    this.subtitle,
    this.offerText,
    this.brandLabel,
    this.termsText,
    this.redirectUrl,
    this.imageUrl,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) {
    return HomeBanner(
      id: json['id'] ?? 0,
      tagText: json['tag_text'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      offerText: json['offer_text'],
      brandLabel: json['brand_label'],
      termsText: json['terms_text'],
      redirectUrl: json['redirect_url'],
      imageUrl: json['image_url'],
    );
  }
}

class AdProduct {
  final int id;
  final String brand;
  final String productName;
  final String ctaText;
  final bool isAd;
  final String? redirectUrl;
  final String? imageUrl;

  AdProduct({
    required this.id,
    required this.brand,
    required this.productName,
    required this.ctaText,
    required this.isAd,
    this.redirectUrl,
    this.imageUrl,
  });

  factory AdProduct.fromJson(Map<String, dynamic> json) {
    return AdProduct(
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      productName: json['product_name'] ?? '',
      ctaText: json['cta_text'] ?? '',
      isAd: json['is_ad'] ?? false,
      redirectUrl: json['redirect_url'],
      imageUrl: json['image_url'],
    );
  }
}

class SuggestedProduct {
  final int categoryId;
  final int id;
  final String brand;
  final String name;
  final double rating;
  final int ratingCount;
  final double price;
  final double mrp;
  final int discountPercent;
  final String? imageUrl;

  SuggestedProduct({
    required this.id,
    required this.brand,
    required this.name,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.mrp,
    required this.discountPercent,
    this.imageUrl,
    required this.categoryId,
  });

  factory SuggestedProduct.fromJson(Map<String, dynamic> json) {
    return SuggestedProduct(
      categoryId: json['category_id'] ?? 0,
      id: json['id'] ?? 0,
      brand: json['brand'] ?? '',
      name: json['name'] ?? '',
      rating: (json['rating'] as num? ?? 0).toDouble(),
      ratingCount: json['rating_count'] ?? 0,
      price: (json['price'] as num? ?? 0).toDouble(),
      mrp: (json['mrp'] as num? ?? 0).toDouble(),
      discountPercent: json['discount_percent'] ?? 0,
      imageUrl: json['image_url'],
    );
  }
}

class LiveStream {
  final int id;
  final String title;
  final String? badgeText;
  final String? offerText;
  final bool isLive;
  final String? streamUrl;
  final String? thumbnailUrl;

  LiveStream({
    required this.id,
    required this.title,
    this.badgeText,
    this.offerText,
    required this.isLive,
    this.streamUrl,
    this.thumbnailUrl,
  });

  factory LiveStream.fromJson(Map<String, dynamic> json) {
    return LiveStream(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      badgeText: json['badge_text'],
      offerText: json['offer_text'],
      isLive: json['is_live'] ?? false,
      streamUrl: json['stream_url'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}

class BottomNavItem {
  final int id;
  final String label;
  final String slug;
  final bool isSelected;
  final String? iconUrl;

  BottomNavItem({
    required this.id,
    required this.label,
    required this.slug,
    required this.isSelected,
    this.iconUrl,
  });

  factory BottomNavItem.fromJson(Map<String, dynamic> json) {
    return BottomNavItem(
      id: json['id'] ?? 0,
      label: json['label'] ?? '',
      slug: json['slug'] ?? '',
      isSelected: json['is_selected'] ?? false,
      iconUrl: json['icon_url'],
    );
  }
}
