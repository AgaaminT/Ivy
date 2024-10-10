import 'package:ivy/api/base/base_repository.dart';
import 'package:ivy/model/EmailAuthResponse_model.dart';
import 'package:ivy/res/components/api_constants.dart';

class AuthRepository extends BaseRepository {

  // Existing email verification method
  Future<EmailAuthResponse> verifyEmail(String email) async {
    try {
      final response = await request(
        url: ApiConstants.registrationApiEndPoint,
        type: RequestType.POST,
        body: {'email': email},
      );
      return EmailAuthResponse.fromJson(response);
    } catch (e) {
      print("Error during email verification: $e");
      throw Exception('Failed to verify email');
    }
  }

  // Updated OTP verification method
  Future<EmailAuthResponse> verifyOtp(String email, String code) async {
    try {
    
      final response = await request(
        url: ApiConstants.verificationEndPoint,
        type: RequestType.POST,
        body: {'email': email, 'code': code}, 
      );
      return EmailAuthResponse.fromJson(response);
    } catch (e) {
      print("Error during OTP verification: $e");
      throw Exception('Failed to verify OTP');
    }
  }


  Future<EmailAuthResponse> resendOtp(String email) async {
    try {
      final response = await request(
        url: ApiConstants.resendOtpEndpoint,
        type: RequestType.POST,
        body: {'email': email}, // Send email in the request body
      );
      return EmailAuthResponse.fromJson(response);
    } catch (e) {
      print("Error during resend OTP: $e");
      throw Exception('Failed to resend OTP');
    }
  }
}
