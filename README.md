# 🦸‍♂️ Super Heroes App

**Super Heroes App** is a Flutter application that displays information about your favorite **superheroes** using data fetched from **RapidAPI**. The app leverages modern Flutter development tools and practices.

---

## ✨ Features

- 🦸 Browse a list of superheroes.
- 📄 View detailed information about each hero.
- 🔄 Data is fetched dynamically from **RapidAPI**.
- 📱 Smooth, modern UI with **carousel slider** to showcase featured heroes.

---

## 🛠️ Technologies & Packages

This app is built with **Flutter** and relies on the following packages:

| Package | Purpose |
|---|---|
| [`retrofit`](https://pub.dev/packages/retrofit) | API client generation |
| [`dio`](https://pub.dev/packages/dio) | HTTP requests |
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | State management |
| [`flutter_hooks`](https://pub.dev/packages/flutter_hooks) | Functional widgets and hooks support |
| [`get_it`](https://pub.dev/packages/get_it) | Dependency injection |
| [`equatable`](https://pub.dev/packages/equatable) | Simplified state comparison |
| [`carousel_slider`](https://pub.dev/packages/carousel_slider) | Horizontal sliding hero banners |

---

## 📐 Architecture

- **BLoC (Business Logic Component)** pattern is used for state management.
- **retrofit** combined with **dio** handles networking and API interactions.
- **get_it** handles dependency injection.
- **flutter_hooks** is used for improved widget lifecycle management.
- The app is modular and structured for future scalability.

---

## 🖥️ Platforms

- ✅ Android
- ✅ iOS
- ✅ Windows (optional with adjustments)

---

## 📥 Installation & Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/Gemy-Dev/SuperHeroes.git
    ```
2. Navigate into the project folder:
    ```bash
    cd super_heroes
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app on your desired platform:
    ```bash
    flutter run
    ```

---

## 📄 Future Plans

- 🔄 Add **search functionality** to find heroes quickly.
- 📊 Add offline caching for hero data.
- 🎨 Improve UI design for tablets and larger screens.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## ⚠️ Notes

- To run this app, you need a **RapidAPI key**.
- Make sure you add the API key in your `retrofit` setup (likely in `interceptors` or configuration files).
- This app is built for educational purposes and showcases **API integration, state management, and clean architecture**.

---
## Show Video

https://github.com/Gemy-Dev/SuperHeroes/assets/57642488/b9be7b25-74ee-414b-978e-46defe5d2e7f

## 📧 Contact

For any questions, suggestions, or contributions, feel free to **open an issue** or **submit a pull request**.

---

Made with ❤️ using Flutter.



