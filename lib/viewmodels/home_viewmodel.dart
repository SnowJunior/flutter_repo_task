import 'dart:async';
import 'package:flutter/material.dart';
import 'package:github/models/repository.model.dart';
import 'package:github/service/main_service.dart';
import 'package:github/utils/utils.dart';
import 'package:stacked/stacked.dart';

/// ViewModel for managing user repositories fetched from GitHub.
/// It handles user input debouncing, pagination, and error management.
class HomeViewModel extends BaseViewModel {
  /// Controller for capturing username input.
  final TextEditingController usernameController = TextEditingController();

  /// Internal list to store fetched repositories.
  List<GithubRepo> _repositoryList = [];

  /// Getter for repository list.
  List<GithubRepo> get repositoryList => _repositoryList;

  /// Tracks errors in fetching repositories.
  bool _hasError = false;
  @override
  bool get hasError => _hasError;

  /// Page tracking.
  int _page = 1;
  int get pageNumber => _page;

  /// Service instance for API interactions.
  final ProjectService _projectService = ProjectService();

  /// Timer for debounce implementation.
  Timer? _debounce;

  /// Updates error state and notifies listeners.
  set hasError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  /// Moves to the next page
  void nextPage() {
    if (_page >= 1) {
      _page++;
      logThis("Navigating to page $pageNumber");
      getUserProjects(usernameController.text);
    }
  }

  // Move back to previous page
  void previousPage() {
    _page--;
    logThis("Navigating to page $pageNumber");
    getUserProjects(usernameController.text);
  }

  /// Handles debounce when user types in the search field.
  void onDebounce(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getUserProjects(value);
    });
  }

  /// Fetches user repositories from GitHub.
  Future<void> getUserProjects(String username) async {
    if (username.trim().isEmpty) return;

    setBusy(true);
    try {
      final response = await _projectService.fetchProjects(
        username: username.trim(),
        page: pageNumber.toString(),
      );
      if (response != null && response.isNotEmpty) {
        _repositoryList = response;
        hasError = false;
      } else {
        _repositoryList = [];
        // hasError = true;
      }
    } catch (e) {
      logThis("Error fetching repositories: $e");
      _repositoryList = [];
      hasError = true;
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
