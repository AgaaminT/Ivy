import 'package:flutter/material.dart';
import 'package:ivy/model/EmailAuthResponse_model.dart';
import 'package:ivy/repository/auth_repo.dart';

class EmailAuthProvider with ChangeNotifier {
  AuthRepository _authRepository = AuthRepository();
  bool _isLoading = false;
  EmailAuthResponse? _response;

  bool get isLoading => _isLoading;
  EmailAuthResponse? get response => _response;

  // Email verification method remains unchanged
  Future<void> verifyEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      _response = await _authRepository.verifyEmail(email);
    } catch (e) {
      _response =
          EmailAuthResponse(status: 'error', message: 'Failed to send OTP');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //  OTP verification method
  Future<void> verifyOtp(String email, String code) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Ensure both email and code are passed to the repository method
      _response = await _authRepository.verifyOtp(
          email, code); 
    } catch (e) {
      _response = EmailAuthResponse(
          status: 'error', message: 'OTP verification failed');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> resendOtp(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      _response = await _authRepository.resendOtp(email);
    } catch (e) {
      _response = EmailAuthResponse(
          status: 'error', message: 'Failed to resend OTP');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
