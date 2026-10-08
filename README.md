# ShopEase 🛍️

**ShopEase** is a modern, feature-rich **Flutter e-commerce mobile application** built for **Android and iOS**. It showcases a complete shopping experience — onboarding, authentication, a browsable storefront, product details, cart, checkout, wishlist, orders, and a personal profile — wrapped in a clean Material Design UI with a bundled **Poppins** font set, light/dark themes, and polished loading/shimmer/animation states.

> A portfolio-grade Flutter project demonstrating clean folder architecture, GetX state management, reusable widget design, and Firebase integration.

---

## 📱 About the Project

ShopEase was built to demonstrate how a production-style e-commerce storefront can be implemented in Flutter. It solves the classic "everything crammed into one `main.dart`" problem by organizing code into features, common widgets, repositories, and utilities — the same structure used in large-scale Flutter apps.

The app currently ships with a **fully interactive UI flow** backed by **sample/static data** (products, categories, banners, cart, orders are hard-coded widgets). Authentication and user-profile persistence are wired to **Firebase**, which is temporarily **skipped at startup** (see [🔥 Firebase](#-firebase)) so the app can be previewed instantly in **guest mode** without configuration.

The goal is a clean, honest, and extensible foundation: real catalogs, payments, and persistence can be dropped in as the data layer evolves.

---

## ✨ Features

Implemented in the current codebase:

**Authentication & Onboarding**
- Onboarding carousel with page indicator, skip & next (first-run flag stored locally)
- Email & password **Sign In** / **Register** with form validation
- **Email verification** flow
- **Password reset** (forgot password) flow
- **Google Sign-In** (via `google_sign_in`)
- Logout and **account deletion** (with re-authentication)

**Storefront**
- Home screen: promotional banner carousel, popular categories, popular products grid, search bar UI
- Store screen: search bar, featured brands, category tabs (Sports, Furniture, Electronics, Clothes, Cosmetics)
- Category → sub-category navigation
- Product details screen: image slider, attributes, metadata, ratings, share & add-to-cart UI
- Product reviews screen with rating breakdown and user review cards
- All-products / brand screens

**Commerce UI**
- Wishlist screen
- Cart screen with quantity controls and coupon field
- Checkout screen: billing address, payment method (PayPal UI), amount breakdown
- Orders screen with status and dates
- Address list + add-new-address form

**Profile & Personalization**
- User profile screen with profile menu
- Account settings screen with toggles and settings tiles
- Change first/last name (Firestore-backed in code)
- Local storage helpers

**UI / UX**
- Material Design, light + dark theme, custom themed widgets
- Reusable design system (`common/widgets`), icons via **Iconsax**
- Loading spinners, full-screen loaders, shimmer placeholders, snackbars, Lottie animations
- Connectivity checks before network actions
- Native splash screen (light/dark)

> ⚠️ **Note:** Product catalog, search, cart, wishlist, and order content are currently **sample/static UI data**. The search bar is a visual container, and "Add to cart"/wishlist buttons don't persist state yet. See [🔮 Future Improvements](#-future-improvements).

---

## 🛠️ Tech Stack

| Area | Technology |
| --- | --- |
| Framework | **Flutter** (3.41.6 stable) |
| Language | **Dart** (SDK `^3.7.2`) |
| State Management | **GetX** (`get`) — state, routing, dependency injection |
| Firebase | `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage` |
| Social Auth | `google_sign_in` |
| Local Storage | `get_storage` |
| Networking | `http` (helper scaffold only) |
| Utilities | `connectivity_plus`, `logger`, `intl`, `url_launcher` |
| UI | Material Design, `iconsax`, `carousel_slider`, `smooth_page_indicator`, `readmore`, `flutter_rating_bar`, `lottie`, `shimmer` |
| Splash | `flutter_native_splash` |
| Fonts | Bundled Poppins (multiple weights & italic) |

---

## 🏗️ Architecture

ShopEase follows a **feature-first**, layered architecture with GetX providing controllers, bindings, and injectable repositories. UI stays in **features**, shared UI lives in **common**, platform/backend logic lives in **data**, and reusable helpers live in **utils**.

```text
lib/
├── bindings/                 # GetX bindings (e.g. GeneralBindings)
├── common/                   # Reusable app-wide widgets & styles
│   ├── styles/
│   └── widgets/              # appbar, products, layouts, images, texts...
├── data/
│   └── repositories/
│       ├── authentication/   # AuthenticationRepository (FirebaseAuth)
│       └── user/             # UserRepository (Firestore "Users")
├── features/                 # Feature modules (screens + controllers)
│   ├── authentication/       # onboarding, login, signup, password, verify email
│   ├── shop/                 # home, store, wishlist, cart, checkout, orders,
│   │                         # product details, reviews, categories, brands
│   └── personalization/      # profile, settings, addresses, user controller/model
├── utils/
│   ├── constants/            # colors, sizes, text strings, images, enums
│   ├── exceptions/           # Firebase / platform / format exception mappers
│   ├── helpers/              # network manager, pricing calculator, formatters
│   ├── http/                 # THttpHelper (REST scaffold, currently unused)
│   ├── local_storage/        # GetStorage-based storage utility
│   ├── popups & loaders/     # snackbars, full-screen loaders, shimmer, animation
│   ├── theme/                # light/dark theme + custom widget themes
│   └── validators/           # form validation helpers
├── app.dart                  # GetMaterialApp root
├── main.dart                 # Entry point (GetStorage, splash, Firebase, runApp)
├── navigation_menu.dart      # Bottom navigation (Home / Store / Wishlist / Profile)
└── firebase_options.dart     # Generated Firebase options
```

**Key decisions**

- **GetX controllers** live beside their feature screens and manage state reactively (`Rx`, `Obx`).
- **Repositories** encapsulate Firebase access (`AuthenticationRepository`, `UserRepository`) and are registered once via `Get.put()`.
- **`GetMaterialApp`** with `GeneralBindings` initializes the shared `NetworkManager`.
- **Design system**: shared widgets in `common/widgets` (product cards, app bars, list tiles, text elements) keep screens consistent and DRY.

---

## 📂 Project Structure

| Directory | Responsibility |
| --- | --- |
| `lib/features/authentication` | Onboarding, login, registration, email verification, password reset — controllers + screens |
| `lib/features/shop` | The storefront: home, store, categories, product details/reviews, wishlist, cart, checkout, orders |
| `lib/features/personalization` | User profile, account settings, address management, `UserModel` |
| `lib/common/widgets` | Reusable UI building blocks (product cards, grids, app bar, tiles, images, texts) |
| `lib/data/repositories` | Data access layer: authentication (FirebaseAuth) and user (Firestore) |
| `lib/utils` | Constants, exceptions, helpers, formatters, HTTP scaffold, local storage, loaders, themes, validators |
| `lib/bindings` | GetX initialization bindings |
| `lib/navigation_menu.dart` | Root bottom-tab navigation |

---

## 🔐 Authentication

Authentication is implemented with **Firebase Authentication** and exposed through `AuthenticationRepository` (`lib/data/repositories/authentication/`):

- **Email / password** — sign in, register, logout
- **Email verification** — mandatory-verification flow after signup
- **Password reset** — forgot-password screen
- **Google Sign-In** — via `google_sign_in`, exchanges Google credentials through Firebase
- **Re-authentication** — required before deleting an account (email/password)
- **Account deletion** — removes the user record and Firestore profile

Forms are validated before submission (`lib/utils/validators`), network availability is checked (`NetworkManager`), and errors are mapped to friendly messages via the exception mappers in `lib/utils/exceptions`.

> While Firebase initialization is commented out (guest mode), these actions fail gracefully with a snackbar instead of crashing — see [🔥 Firebase](#-firebase).

---

## 🔌 API Integration

There is **no active REST API integration** in this project.

- `lib/utils/http/http_client.dart` provides a small `THttpHelper` scaffold (GET/POST/PUT/DELETE with JSON parsing) but it uses a **placeholder base URL** and is **not wired to any feature**.
- `lib/utils/constants/api_constants.dart` is an empty placeholder.
- The shop catalog is currently **sample/static data** in the UI layer, not remote data.

No API keys, tokens, or secrets are committed to the repository.

---

## 🔥 Firebase

Firebase is **integrated in the codebase** but is currently **disabled at startup** so the app runs without configuration:

- **Firebase Authentication** — email/password, Google, email verification, password reset (`firebase_auth`)
- **Cloud Firestore** — user profile CRUD in the `Users` collection (`UserRepository`)
- **Cloud Storage** — `TCloudHelperFunctions` provides upload/download helpers (currently unused)
- **Firebase options** — generated `lib/firebase_options.dart`; Android config `android/app/google-services.json` is present
- **Startup** — `Firebase.initializeApp()` in `lib/main.dart` is **commented out**; the app boots into a guest storefront using local storage for first-run/onboarding state

To enable Firebase, follow [Configuring Firebase](#configuring-firebase) in Getting Started.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) 3.41.6 or newer (Dart SDK `^3.7.2`)
- **Android**: Android Studio + Android SDK / emulator
- **iOS** (macOS only): Xcode + iOS Simulator
- [Firebase CLI](https://firebase.google.com/docs/cli) *(only if enabling Firebase)*

### Installation

```bash
git clone <repository-url>
cd flutter-shopease
flutter pub get
```

> The repository URL placeholder `<repository-url>` is where you'll paste your GitHub HTTPS/SSH URL for `flutter-shopease`.

### Configuring Firebase

Firebase is optional for previewing the UI (the app runs in guest mode). To enable real auth & user profiles:

1. Create a project at the [Firebase console](https://console.firebase.google.com/).
2. **Android**: add an Android app, download `google-services.json`, and place it in `android/app/` (one is already present — update it with your values).
3. **iOS**: add an iOS app and download `GoogleService-Info.plist` into `ios/Runner/`.
4. Enable **Email/Password** and **Google** sign-in providers under *Authentication → Sign-in method*.
5. Uncomment the Firebase initialization block in `lib/main.dart`:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
```

6. Re-run with `flutter clean` for Android/iOS plugin regeneration if needed.

### Run the Application

```bash
flutter run
```

> On first launch the onboarding carousel appears; after completing it you'll reach the login screen. While Firebase is skipped, tapping **Sign In** enters the app in **guest mode**.

---

## 📸 Screenshots

Coming soon — screenshots of the onboarding, home, store, product details, cart, checkout, and profile screens will be added here.

---

## 🧪 Testing

The project has only the default Flutter **counter smoke test** scaffold (`test/widget_test.dart`), which is **not aligned** with this app's screens and currently fails on `flutter test`. This is a known starting point for a proper test suite.

```bash
flutter test
```

Planned: widget tests for auth flows, storefront navigation, and controller unit tests.

---

## 📦 Build

### Android

```bash
flutter build apk --release        # APK (debug installs / side-loading)
flutter build appbundle --release  # Google Play AAB
```

### iOS

```bash
flutter build ios --release
```

> Release builds that require Firebase must have the platform config from [Configuring Firebase](#configuring-firebase) in place first.

---

## 🔮 Future Improvements

These are **planned** and not yet implemented:

- **Payment gateway integration** — real Stripe / PayPal / RazorPay checkout instead of the static payment UI
- **Backend product catalog** — replace hard-coded sample data with Firestore or a REST API products/categories/brands source
- **Functional search & filtering** — wire the search bar + category filters to real data
- **Persistent cart & wishlist** — quantity updates and item state backed by `get_storage`/Firestore
- **Real order management & order tracking** — create orders at checkout and track status in Firestore
- **Product reviews & ratings submission** — let users write reviews instead of displaying sample cards
- **Push notifications** — Firebase Cloud Messaging for order/price alerts
- **Admin dashboard** — manage products, orders, and users
- **Advanced recommendations** — personalized product suggestions based on browsing history
- **Multi-language (i18n) support** — the text-constant layer is already centralized for easy localization
- **Proper test suite** — replace the default smoke test with real widget/unit tests

---

## 👨‍💻 Developer

Built with ❤️ as a Flutter portfolio project.

- **Author:** Aarogya Ojha
- **Repository:** `flutter-shopease`

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.