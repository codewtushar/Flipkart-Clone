# Task 2 - Flipkart Clone 

A Flutter-based Flipkart-inspired shopping application built as part of a Flutter development assignment. The project focuses on recreating the shopping experience with a responsive UI, API integration, reactive state management and a clean MVC-based project structure.

## Features

### Home Screen
- Flipkart-inspired home screen UI.
- Dynamic home content fetched from a REST API.
- Service tabs, category navigation and promotional banners.
- Product advertisement and suggested product sections.
- Floating live stream card with dismiss functionality.
- Custom bottom navigation bar.

### Search & Categories
- Functional product search.
- Case-insensitive filtering by product name and brand.
- Interactive category selection.
- Reactive UI updates using GetX.

### Product Details
- Navigation from product cards to a dedicated details screen.
- Dynamic product name and locally stored product images.
- Flipkart-inspired search header.
- Add to Cart and Buy Now buttons with interactive feedback.

### Additional Features
- Custom native splash screen and application launcher icon.
- Local asset handling for product images and banners.
- Loading, error and retry states for API requests.
- Responsive layouts using Flutter ScreenUtil.

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI development |
| Dart | Application programming language |
| GetX | State management and navigation |
| Dio | REST API communication |
| Flutter ScreenUtil | Responsive UI scaling |
| Cached Network Image | Network image handling |
| JSON Serialization | API response parsing |

## Architecture

The project follows an MVC-inspired structure to separate UI, business logic, data models and API communication.

```text
lib/
├── main.dart
│
├── model/
│   └── home_model.dart
│
├── views/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── product_details_screen.dart
│   │
│   └── widgets/
│       ├── home_header.dart
│       ├── banner_section.dart
│       ├── ad_products_section.dart
│       ├── suggested_products.dart
│       ├── live_stream_card.dart
│       └── bottom_navigation.dart
│
├── controllers/
│   └── home_controller.dart
│
├── services/
│   └── api_service.dart
│
└── utils/
    └── app_colors.dart

assets/
└── images/
    ├── app_logo.png
    ├── banners/
    ├── ads/
    ├── suggested/
    └── live/
```

### Architecture Responsibilities

- **Model:** Defines Dart classes and parses API responses into structured objects.
- **View:** Contains screens and reusable UI components.
- **Controller:** Manages reactive application state and user interactions through GetX.
- **Services:** Handles API requests using Dio.
- **Utils:** Contains shared application constants and styling.

## API Integration

The application fetches its home screen content from:

```text
GET https://your-keeper.com/keeper/api/home/get_home.php
```

The API provides data for:
- Delivery address and SuperCoin balance.
- Search configuration.
- Service tabs and categories.
- Promotional banners and advertisements.
- Suggested products.
- Live streams.
- Bottom navigation items.

API responses are parsed into Dart model classes before being consumed by the UI.

**Image handling:** Local assets are used for visual content where the API image URLs are unavailable or use placeholder domains.

## State Management

GetX is used for reactive state management.

Key concepts implemented:
- `GetxController` for application logic
