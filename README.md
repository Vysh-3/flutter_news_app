# 📰 Flutter News App

A news app built using Flutter that allows users to log in (locally), read the latest news from a public API, bookmark articles, and theme adjusts based on system setting (if system is in dark mode, app uses dark theme; otherwise, light theme)

---

## ✅ Features

- 🔐 **Login Page**  
  - Local login (email/password)
  - Session saved using `SharedPreferences`

- 📰 **News Feed**  
  - Integrated with NewsAPI.org (or alternative)
  - Displays title, image, source, published date
  - Pull-to-refresh
  - Opens article in WebView

- 🔖 **Bookmarks Page**  
  - Save/remove articles to bookmarks
  - Persistent storage using SharedPreferences

- 🌓 **Dark Mode Toggle**  
  - Theme adjusts based on system setting (if system is in dark mode, app uses dark theme; otherwise, light theme)
 
- ### 🔑 News API Key

This project uses [NewsAPI.org](https://newsapi.org) for fetching articles.

To run the app, create a free account and get your API key:

1. Go to [https://newsapi.org](https://newsapi.org)
2. Sign up and copy your API key
3. Open `lib/features/news/news_service.dart`
4. Replace:

```dart
const apiKey = 'YOUR_API_KEY_HERE';

```
---

## 🛠️ Setup Instructions

### 🔧 Prerequisites

- Flutter SDK (3.16 or later)
- Dart SDK
- Android Studio / VS Code

### 🔌 Clone the Repository

```bash
git clone https://github.com/Vysh-3/flutter_news_app.git
cd flutter_news_app
