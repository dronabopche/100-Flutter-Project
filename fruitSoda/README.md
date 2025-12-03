 # FruitSoda 🍎🥤
 <div align="right"> 

  <img src="assets/images/logo.png" width="120" height="120" style="border-radius: 50%;">

</div>
**Fresh Juice Delivery App - Order healthy, delicious fruit juices with just a few taps!**

<div align="center">

<img src="assets/images/banner1.png" width="100%" height="100%">

[![Flutter](https://img.shields.io/badge/Flutter-3.16.0-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2.0-0175C2?style=for-the-badge&logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)

[Demo](#demo) • [Features](#features) • [Installation](#installation) • [Screenshots](#screenshots) • [Tech Stack](#tech-stack)

</div>

## 📱 About FruitSoda

FruitSoda is a modern Flutter-based mobile application that brings fresh, healthy fruit juices directly to your doorstep. With an intuitive interface and seamless user experience, FruitSoda makes it easy to order your favorite beverages while promoting healthy lifestyle choices.

### 🎯 Key Highlights

- **🚀 Built with Flutter** - Cross-platform compatibility
- **🔥 Firebase Backend** - Real-time data synchronization
- **🍎 Healthy Focus** - Promoting nutritious beverage choices
- **💳 Secure Payments** - Multiple payment options
- **📱 Beautiful UI** - Modern, user-friendly interface

## ✨ Features

### 🛍️ Core Features
- **Product Catalog** - Browse extensive collection of fresh juices
- **Smart Search** - Find your favorite drinks quickly
- **Shopping Cart** - Easy add/remove items with quantity management
- **User Authentication** - Secure login/signup with Firebase
- **Order Tracking** - Real-time order status updates

### 🎨 User Experience
- **Responsive Design** - Optimized for all screen sizes
- **Dark/Light Theme** - Customizable appearance
- **Smooth Animations** - Enhanced user interactions
- **Offline Support** - Basic functionality without internet

### 🔒 Security & Performance
- **Secure Payments** - Encrypted transaction processing
- **Fast Loading** - Optimized images and lazy loading
- **Data Validation** - Robust form validation
- **Error Handling** - Graceful error management

<div align="center">

<img src="assets/images/banner2.png" width="100%" height="100%">

</div>
## 🛠️ Tech Stack

### **Frontend & Framework**
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)

### **Backend & Database**
![Firebase Auth](https://img.shields.io/badge/Firebase_Auth-FFCA28?style=flat-square&logo=firebase&logoColor=black)
![Cloud Firestore](https://img.shields.io/badge/Cloud_Firestore-FFCA28?style=flat-square&logo=firebase&logoColor=black)
![Firebase Storage](https://img.shields.io/badge/Firebase_Storage-FFCA28?style=flat-square&logo=firebase&logoColor=black)

### **State Management**
![Provider](https://img.shields.io/badge/Provider-8E44AD?style=flat-square&logo=flutter&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-00C853?style=flat-square&logo=flutter&logoColor=white)

### **Development Tools**
![VS Code](https://img.shields.io/badge/VS_Code-007ACC?style=flat-square&logo=visual-studio-code&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)

## 📸 Screenshots

<div align="center">

### **App Screenshots**
| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
| **Splash Screen** | **Login Screen** | **Home Screen** |
| <img src="https://via.placeholder.com/200x400/4ECDC4/FFFFFF?text=Splash" width="200"> | <img src="https://via.placeholder.com/200x400/FF6B6B/FFFFFF?text=Login" width="200"> | <img src="https://via.placeholder.com/200x400/45B7D1/FFFFFF?text=Home" width="200"> |
| **Product Catalog** | **Shopping Cart** | **Order Tracking** |
| <img src="https://via.placeholder.com/200x400/96CEB4/FFFFFF?text=Catalog" width="200"> | <img src="https://via.placeholder.com/200x400/FECA57/FFFFFF?text=Cart" width="200"> | <img src="https://via.placeholder.com/200x400/FF9FF3/FFFFFF?text=Track" width="200"> |

</div>

## 🚀 Installation

### Prerequisites
- Flutter SDK (version 3.16.0 or higher)
- Dart SDK (version 3.2.0 or higher)
- Android Studio/VSCode with Flutter extension
- Firebase project setup

### Step-by-Step Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/dronabopche/fruitSoda.git
   cd fruitSoda
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories

4. **Run the App**
   ```bash
   flutter run
   ```

### Platform Specific Setup

<details>
<summary>📱 Android Setup</summary>

1. Update `android/app/src/main/AndroidManifest.xml` with your Google Maps API key
2. Ensure minimum SDK version is 21 or higher
3. Add internet permissions

</details>

<details>
<summary>🍎 iOS Setup</summary>

1. Update iOS deployment target to 11.0 or higher
2. Configure necessary permissions in `Info.plist`
3. Set up signing & capabilities in Xcode

</details>

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── landingPage.dart
├── login.dart
├──  Homepage.dart

```


## 🎯 Future Enhancements

### Planned Features
- [ ] **Loyalty Program** - Rewards and points system
- [ ] **Subscription Model** - Weekly/Monthly juice plans
- [ ] **AI Recommendations** - Personalized drink suggestions
- [ ] **Social Features** - Share orders and reviews
- [ ] **Delivery Tracking** - Real-time GPS tracking

### Technical Improvements
- [ ] **Unit Testing** - Comprehensive test coverage
- [ ] **CI/CD Pipeline** - Automated testing and deployment
- [ ] **Microservices** - Backend architecture upgrade
- [ ] **Web Admin Panel** - Merchant management interface

## 🤝 Contributing

We love contributions! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Development Guidelines
- Follow [Flutter Style Guide](https://flutter.dev/docs/development/tools/formatting)
- Write meaningful commit messages
- Add tests for new features
- Update documentation accordingly

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

<div align="center">

**Drona Bopche**  
*Flutter Developer | Quantum Computing Enthusiast*

[![Portfolio](https://img.shields.io/badge/Portfolio-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white)](https://dronabopche.github.io)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](www.linkedin.com/in/drona-bopche-2345292b1)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dronabopche)

</div>

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing framework
- **Firebase** - For robust backend services
- **Icons8** - For beautiful icons and illustrations
- **Open Source Community** - For continuous inspiration

---

<div align="center">

### **💡 "Stay hydrated, stay healthy with FruitSoda!"**

⭐ **If you like this project, don't forget to give it a star!**

![Visitor Count](https://komarev.com/ghpvc/?username=dronabopche-fruitsoda&color=blueviolet&style=flat-square)

</div>

## 📞 Support

If you have any questions or need help with setup, feel free to:
- 📧 Email: dronabopche@gmail.com
- 💬 Open an [Issue](https://github.com/dronabopche/fruitSoda/issues)
- 🐛 Report a [Bug](https://github.com/dronabopche/fruitSoda/issues/new?template=bug_report.md)
- 💡 Request a [Feature](https://github.com/dronabopche/fruitSoda/issues/new?template=feature_request.md)

---

**Built with 💙 using Flutter & Firebase**
