# ShopEase 🛍️

**ShopEase** is a modern Flutter e-commerce mobile application for **Android and iOS**, providing a complete shopping experience with onboarding, authentication, product browsing, categories, product details, wishlist, cart, checkout, orders, and user profile management.

The application is built using a **feature-first architecture**, **GetX state management**, **Firebase services**, reusable UI components, local storage, and a structured data/repository layer designed for maintainability and future backend integration.

---

## 📱 About the Project

ShopEase is designed as a scalable e-commerce mobile application with a clean and maintainable Flutter codebase.

The project separates application features, data repositories, common widgets, utilities, authentication, and configuration into dedicated modules. This makes the application easier to maintain, extend, test, and hand over for continued development.

The current product catalog and several commerce-related areas use predefined application data. The data layer is structured so these areas can be connected to a production REST API, Firebase backend, or another backend service as development progresses.

### Key Areas

* Flutter application architecture
* Feature-based project organization
* GetX state management
* Firebase Authentication
* Cloud Firestore integration
* Google Sign-In
* Reusable UI components
* Form validation
* Error handling
* Local storage
* Light and dark themes
* Loading and shimmer states
* Android and iOS configuration
* Repository-based data layer
* Scalable application structure

---

# ✨ Features

## 🔐 Authentication & Onboarding

* Onboarding carousel
* Page indicators
* Skip and Next navigation
* First-run state management
* Email/password registration
* Email/password login
* Form validation
* Email verification
* Forgot password / password reset
* Google Sign-In
* Logout
* Account deletion
* Re-authentication before account deletion

---

## 🛍️ Storefront

* Promotional banner carousel
* Popular categories
* Popular products
* Product grid
* Store screen
* Featured brands
* Category navigation
* Sub-category navigation
* Product details
* Product image slider
* Product attributes
* Product metadata
* Product ratings
* Product reviews
* Brand/product listing screens
* Product sharing

---

## 🛒 Shopping

* Wishlist
* Shopping cart
* Product quantity controls
* Coupon input
* Checkout
* Billing address
* Payment method UI
* Order summary
* Order history
* Order status
* Address management
* Add new address

> **Note:** Product catalog, search, cart, wishlist, and order content currently use predefined application data. These areas are structured for future backend integration and persistent data management.

---

## 👤 Profile & Personalization

* User profile
* Account settings
* First and last name management
* Address management
* Settings controls
* Profile menu
* Local storage utilities
* Firestore-backed user profile structure

---

## 🎨 UI / UX

* Material Design
* Light theme
* Dark theme
* Custom application themes
* Poppins typography
* Iconsax icons
* Reusable UI components
* Product cards
* Custom app bars
* Loading indicators
* Shimmer placeholders
* Full-screen loaders
* Snackbars
* Lottie animations
* Native splash screen
* Responsive layouts

---

# 🛠️ Technology Stack

| Area                  | Technology              |
| --------------------- | ----------------------- |
| Framework             | Flutter 3.41.6          |
| Language              | Dart `^3.7.2`           |
| State Management      | GetX                    |
| Authentication        | Firebase Authentication |
| Database              | Cloud Firestore         |
| Storage               | Firebase Storage        |
| Social Authentication | Google Sign-In          |
| Local Storage         | GetStorage              |
| Networking            | HTTP                    |
| Connectivity          | connectivity_plus       |
| Logging               | logger                  |
| Formatting            | intl                    |
| URL Handling          | url_launcher            |
| Icons                 | Iconsax                 |
| Carousel              | carousel_slider         |
| Page Indicators       | smooth_page_indicator   |
| Ratings               | flutter_rating_bar      |
| Animation             | Lottie                  |
| Loading UI            | Shimmer                 |
| Splash Screen         | flutter_native_splash   |
| Fonts                 | Poppins                 |

---

# 🏗️ Architecture

ShopEase follows a **feature-first architecture** with separation between UI, state management, repositories, utilities, and shared components.

```text
lib/
├── bindings/
│   └── GetX application bindings
│
├── common/
│   ├── styles/
│   └── widgets/
│       ├── appbar
│       ├── products
│       ├── layouts
│       ├── images
│       ├── texts
│       └── reusable components
│
├── data/
│   └── repositories/
│       ├── authentication/
│       └── user/
│
├── features/
│   ├── authentication/
│   │   ├── onboarding
│   │   ├── login
│   │   ├── signup
│   │   ├── password
│   │   └── verify email
│   │
│   ├── shop/
│   │   ├── home
│   │   ├── store
│   │   ├── categories
│   │   ├── brands
│   │   ├── products
│   │   ├── wishlist
│   │   ├── cart
│   │   ├── checkout
│   │   ├── orders
│   │   └── reviews
│   │
│   └── personalization/
│       ├── profile
│       ├── settings
│       └── addresses
│
├── utils/
│   ├── constants/
│   ├── exceptions/
│   ├── helpers/
│   ├── http/
│   ├── local_storage/
│   ├── theme/
│   └── validators/
│
├── app.dart
├── main.dart
├── navigation_menu.dart
└── firebase_options.dart
```

---

# 🧩 Architecture Principles

### Feature-Based Organization

Application functionality is divided into independent modules such as authentication, shopping, and personalization.

This allows new features to be added without tightly coupling unrelated parts of the application.

### Reusable Components

Common UI elements are centralized inside:

```text
lib/common/widgets/
```

Examples include:

* Product cards
* App bars
* Buttons
* Images
* Text components
* Layout components
* List tiles
* Loading components

### Repository Pattern

Backend and Firebase operations are handled through dedicated repositories.

Current repositories include:

```text
AuthenticationRepository
UserRepository
```

This provides a clear separation between UI and data access.

### GetX

GetX is used for:

* State management
* Reactive UI updates
* Dependency injection
* Navigation
* Controllers
* Bindings

---

# 🔐 Authentication

Authentication is implemented using **Firebase Authentication**.

Supported functionality includes:

* Email/password registration
* Email/password login
* Email verification
* Password reset
* Google Sign-In
* Logout
* Re-authentication
* Account deletion

Authentication logic is organized under:

```text
lib/data/repositories/authentication/
```

Form validation is handled through:

```text
lib/utils/validators/
```

Network availability is checked before network-dependent operations.

Firebase and platform errors are handled through dedicated exception utilities.

> Firebase initialization is currently disabled at application startup so the application can run without requiring a Firebase configuration.

---

# 🔥 Firebase Integration

Firebase services are integrated into the application for authentication and user-related functionality.

### Firebase Authentication

Used for:

* Email/password authentication
* Google authentication
* Email verification
* Password reset
* Account management

### Cloud Firestore

Used for:

* User profiles
* User information
* Profile updates

### Firebase Storage

Storage helper functionality is available for future image and file upload requirements.

### Configuration

Firebase configuration files include:

```text
lib/firebase_options.dart
android/app/google-services.json
```

For another environment, these should be configured with the appropriate Firebase project credentials.

---

# 🔌 API Integration

The project includes a reusable HTTP layer for future backend integration.

The networking helper is located at:

```text
lib/utils/http/http_client.dart
```

It provides support for:

```text
GET
POST
PUT
DELETE
```

The current application does not depend on an active production REST API.

Product and commerce content currently use predefined application data.

The existing architecture allows the data layer to be extended with:

* Product APIs
* Category APIs
* Brand APIs
* Search APIs
* Cart APIs
* Wishlist APIs
* Order APIs
* User APIs
* Payment APIs

---

# 💾 Local Storage

The application uses **GetStorage** for lightweight local persistence.

Current use cases include:

* Onboarding state
* Application preferences
* Local storage utilities

The storage layer is centralized for easier future expansion.

---

# 🌐 Connectivity

Network connectivity is handled using:

```text
connectivity_plus
```

Connectivity checks can be performed before network-dependent operations to provide appropriate feedback to users.

---

# 🎨 Design System

ShopEase includes a reusable design system for maintaining consistent UI across the application.

### Theme

* Light theme
* Dark theme
* Custom colors
* Custom typography
* Custom widget themes

### Typography

The application uses the **Poppins** font family with multiple weights.

### Icons

The application uses **Iconsax** for iconography.

### Shared Components

Reusable widgets are organized under:

```text
lib/common/widgets/
```

---

# 📂 Project Structure

| Directory                      | Responsibility                                                         |
| ------------------------------ | ---------------------------------------------------------------------- |
| `lib/features/authentication`  | Onboarding, login, registration, verification and password flows       |
| `lib/features/shop`            | Home, store, categories, products, cart, wishlist, checkout and orders |
| `lib/features/personalization` | Profile, settings, addresses and user management                       |
| `lib/common/widgets`           | Reusable UI components                                                 |
| `lib/common/styles`            | Shared application styles                                              |
| `lib/data/repositories`        | Firebase and data access logic                                         |
| `lib/utils/constants`          | Application constants                                                  |
| `lib/utils/exceptions`         | Error handling                                                         |
| `lib/utils/helpers`            | Helper functions and utilities                                         |
| `lib/utils/http`               | HTTP networking layer                                                  |
| `lib/utils/local_storage`      | GetStorage utilities                                                   |
| `lib/utils/theme`              | Application themes                                                     |
| `lib/utils/validators`         | Form validation                                                        |
| `lib/bindings`                 | GetX dependency bindings                                               |

---

# 🚀 Getting Started

## Prerequisites

Install the following before running the project:

* Flutter 3.41.6 or newer
* Dart SDK `^3.7.2`
* Android Studio
* Android SDK
* Android emulator or physical Android device
* Xcode for iOS development
* iOS Simulator or physical iOS device
* Git

Firebase CLI is required when configuring a Firebase project.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/dipanshujindal1992/flutter-shopease.git
```

Navigate to the project:

```bash
cd flutter-shopease
```

Install dependencies:

```bash
flutter pub get
```

Check the Flutter environment:

```bash
flutter doctor
```

Run the application:

```bash
flutter run
```

---

# 🔥 Firebase Configuration

Firebase configuration is required for authentication and user-profile functionality.

### 1. Create Firebase Project

Create a Firebase project:

https://console.firebase.google.com/

### 2. Configure Android

Create an Android application in Firebase and download:

```text
google-services.json
```

Place it inside:

```text
android/app/
```

### 3. Configure iOS

Create an iOS application and download:

```text
GoogleService-Info.plist
```

Place it inside:

```text
ios/Runner/
```

### 4. Enable Authentication

Navigate to:

```text
Firebase Console
→ Authentication
→ Sign-in method
```

Enable:

* Email/Password
* Google

### 5. Enable Firestore

Create a Firestore database if user profile persistence is required.

### 6. Initialize Firebase

Enable the Firebase initialization block in:

```text
lib/main.dart
```

Example:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
).then(
  (FirebaseApp value) =>
      Get.put(AuthenticationRepository()),
);
```

Then run:

```bash
flutter clean
flutter pub get
flutter run
```

> **Security:** Never commit private production credentials, service-account keys, API secrets, or other sensitive information to the repository.

---

# 📱 Application Flow

```text
Splash
   ↓
Onboarding
   ↓
Authentication
   ↓
Home
   ↓
Store
   ↓
Categories
   ↓
Product Details
   ↓
Wishlist / Cart
   ↓
Checkout
   ↓
Orders
   ↓
Profile / Settings
```

The main application sections are accessible through the bottom navigation.

---

# 📸 Screenshots

Screenshots can be added here to document the main application screens and user flows.

Recommended screens:

* Onboarding
* Login
* Registration
* Home
* Store
* Categories
* Product Details
* Product Reviews
* Wishlist
* Cart
* Checkout
* Orders
* Profile
* Settings

---

# 🧪 Testing

The project currently contains the default Flutter testing scaffold.

A dedicated test suite can be expanded as development continues.

Recommended test coverage includes:

### Widget Tests

* Authentication screens
* Home screen
* Product details
* Cart
* Checkout
* Profile

### Unit Tests

* Validators
* Price calculations
* Controllers
* Repository methods
* Utility functions

Run tests with:

```bash
flutter test
```

---

# 📦 Build

## Android APK

```bash
flutter build apk --release
```

The generated release APK can be used for testing and sideloading.

## Android App Bundle

```bash
flutter build appbundle --release
```

The generated AAB can be used for Google Play deployment.

## iOS

```bash
flutter build ios --release
```

App Store distribution requires the appropriate Apple Developer account, signing configuration, provisioning profiles, and platform configuration.

---

# 🔮 Future Improvements

### Backend

* Production REST API
* Product database
* Category APIs
* Brand APIs
* User APIs
* Cart APIs
* Wishlist APIs
* Order APIs

### Commerce

* Stripe integration
* PayPal integration
* Razorpay integration
* Real checkout processing
* Order creation
* Order tracking
* Coupon management

### User Experience

* Functional product search
* Advanced filtering
* Product sorting
* Persistent cart
* Persistent wishlist
* Product reviews
* Product ratings
* Push notifications
* Personalized recommendations

### Administration

* Product management
* Category management
* Order management
* User management
* Inventory management
* Admin dashboard

### Engineering

* Unit testing
* Widget testing
* Integration testing
* CI/CD pipeline
* Automated builds
* Crash reporting
* Analytics
* Performance monitoring
* Multi-language support

---

# 💼 Development Standards

The project follows several development practices intended to keep the codebase maintainable and extensible.

### Modular Architecture

Features are separated into independent modules to reduce coupling.

### Reusable Components

Common UI elements are extracted into shared widgets to minimize duplication.

### Separation of Responsibilities

Presentation, state management, data access, and utility logic are kept in separate layers.

### Centralized Configuration

Application constants, themes, validators, exceptions, and local storage utilities are maintained in dedicated modules.

### Backend Flexibility

The repository/data layer provides a foundation for connecting the application to REST APIs, Firebase, or other backend services.

### Platform Support

The project is configured for both Android and iOS development.

### Documentation

The repository includes setup instructions, architecture documentation, Firebase configuration, build instructions, and future development areas to simplify project onboarding and continued development.

---

# 🔒 Security & Configuration

Before deploying the application to production:

* Configure Firebase using the appropriate project
* Configure Android release signing
* Configure iOS certificates and provisioning
* Replace development configuration
* Configure production API endpoints
* Secure API credentials
* Configure database security rules
* Review Firebase security rules
* Configure payment credentials securely
* Remove development/debug configurations

---

# 🤝 Project Maintenance

The project structure and documentation are organized to make future development and maintenance easier.

The documentation covers:

* Project overview
* Technology stack
* Architecture
* Folder structure
* Authentication
* Firebase configuration
* API layer
* Local storage
* Application flow
* Setup instructions
* Build instructions
* Testing
* Future development

This provides a clear foundation for developers joining the project and continuing implementation.

---

# 👨‍💻 Developer

**Pankaj Bedwal**

Flutter Developer

**GitHub:**
https://github.com/dipanshujindal1992

**Repository:**
https://github.com/dipanshujindal1992/flutter-shopease

---

# 📄 License

Please refer to the `LICENSE` file included in this repository for the applicable license and usage terms.

---

## ⭐ ShopEase

A modern Flutter e-commerce application built with a structured architecture, reusable components, Firebase integration, and a foundation for future backend and commerce integrations.
