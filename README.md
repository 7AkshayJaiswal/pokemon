# Pokémon TCG App

A Flutter application that displays Pokémon Trading Card Game (TCG) cards with search functionality using the official Pokémon TCG API.

## Features

- **Card List & Search**
  - Browse Pokémon cards in a 2x2 grid layout
  - Pagination support (10 cards per page)
  - Search cards by set name
  - Real-time search suggestions

- **Card Details**
  - View detailed card information
  - Display attacks, weaknesses, and abilities
  - Show artist information and set details
  - Smooth animations and transitions

- **UI/UX Features**
  - Modern Material Design
  - Responsive layout
  - Image caching for better performance
  - Loading states and error handling
  - Pull-to-refresh functionality

## Tech Stack

- **State Management**: GetX
- **API Integration**: GetConnect
- **Image Caching**: cached_network_image
- **Route Management**: GetX Router

## Project Structure

lib/
├── app/
│ ├── data/
│ │ ├── models/ # Data models
│ │ └── providers/ # API providers
│ ├── modules/
│ │ ├── home/ # Home page module
│ │ └── card_detail/ # Card detail module
│ └── routes/ # App routes
└── main.dart


## Getting Started

### Prerequisites

- Flutter SDK (2.0 or higher)
- Dart SDK (2.12 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository

git clone [[https://github.com/7AkshayJaiswal/pokemon.git](https://github.com/7AkshayJaiswal/pokemon.git)]


2. Navigate to project directory

```bash
cd pokemon
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the app

```bash
flutter run
```


## API Reference

The app uses the [Pokémon TCG API](https://docs.pokemontcg.io/) for fetching card data.

### Endpoints Used

- Get Cards: `https://api.pokemontcg.io/v2/cards`
- Search by Set: `https://api.pokemontcg.io/v2/cards?q=set.name:{setName}`

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
![Screenshot 2](screenshots/screenshot2.png)

## Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Contact

Akshay Jaiswal - [akshayjaiswal7@gmail.com](akshayjaiswal7@gmail.com)

Project Link: [https://github.com/7AkshayJaiswal/pokemon](https://github.com/7AkshayJaiswal/pokemon)

## Acknowledgments

- [Pokémon TCG API](https://docs.pokemontcg.io/)
- [Flutter Documentation](https://flutter.dev/docs)
- [GetX Package](https://pub.dev/packages/get)