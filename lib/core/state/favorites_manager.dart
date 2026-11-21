import 'package:flutter/material.dart';

/// Centralized state management for member favorites and likes.
/// Uses Flutter's native [ChangeNotifier] to provide reactive updates
/// across the entire application without needing heavy third-party dependencies.
class FavoritesManager extends ChangeNotifier {
  // Singleton pattern
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final Set<int> _favoriteMemberIds = {1};
  final Map<int, int> _endorsementCounts = {
    1: 42,
    2: 38,
    3: 51,
    4: 29,
    5: 45,
    6: 33,
    7: 40,
    8: 36,
    9: 47,
  };

  bool isFavorite(int memberId) => _favoriteMemberIds.contains(memberId);

  void toggleFavorite(int memberId) {
    if (_favoriteMemberIds.contains(memberId)) {
      _favoriteMemberIds.remove(memberId);
    } else {
      _favoriteMemberIds.add(memberId);
    }
    notifyListeners();
  }

  int getEndorsementCount(int memberId) {
    return _endorsementCounts[memberId] ?? 0;
  }

  void incrementEndorsement(int memberId) {
    _endorsementCounts[memberId] = (_endorsementCounts[memberId] ?? 0) + 1;
    notifyListeners();
  }
}
