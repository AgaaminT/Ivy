class ApiConstants {
  static const String baseUrl = "https://domainpanel.agaamin.in/api";


  
  static const String registrationApiEndPoint = '$baseUrl/register';
  static const String verificationEndPoint = "$baseUrl/verifycode";
  static const String resendOtpEndpoint = "$baseUrl/resendcode";

  static const String languageEndpoint = "$baseUrl/languages";
  static const String meEndpoint = "$baseUrl/me?include=roles,preferences";
  static const String userEndpoint = "$baseUrl/users";
  static const String holidayEndpoint = "$baseUrl/holidays";
  static const String attendanceStats = "$baseUrl/attendance-stats";
  static const String employeeTimings = "$baseUrl/employee-timings";
  static const String employeeEmployeeLogs = "$baseUrl/employee-attendances";
  static const String themeEndpoint = "$baseUrl/user-preferences/";
  static const String businessUnitsEndPoint = "$baseUrl/business-units";
  static const String countriesEndPoint = "$baseUrl/countries";
  static const String departmentsEndPoint = "$baseUrl/departments";
  static const String designationsEndPoint = "$baseUrl/designations";
  static const String rolesEndPoint = "$baseUrl/roles";
  static const String holidayPlansEndPoint = "$baseUrl/holiday-plans";
  static const String locationsEndPoint = "$baseUrl/locations";
  static const String organizationsEndPoint = "$baseUrl/organizations";
  static const String systemCodesEndPoint = "$baseUrl/system-codes";
  static const String forgotPasswordEndPoint = "$baseUrl/password-forgot";
  static const String avatarEndpoint = "$baseUrl/uploads/users/";
  static const String employeeDirectoryEndPoint =
      "$baseUrl/organization/users/";
  static const String deleteAttachmentEndPoint = "$baseUrl/document-details";

  static const String attachmentsEndpoint = "$baseUrl/documents";
  static const String attachmentsfileuploadEndpoint =
      "$baseUrl/document-details";
  static const String employeeJobsEndpoint =
      "$baseUrl/employee-jobs?include=user";
  static const String employeeListEndPoint = "$baseUrl/users";
  static const String attendanceEndpoint = "$baseUrl/employee-attendances";
  static const String events = "$baseUrl/dashboard/events";
  static const String assetAttachmentsEndpoint = "$baseUrl/asset-assignments";
  static const String assetsCategoriesEndpoint = "$baseUrl/asset-categories";
  static const String assetsTypesEndpoint = "$baseUrl/asset-types";
  static const String assetsEndpoint = "$baseUrl/assets";
  static const String leaveBalanceEndPoint =
      "$baseUrl/leave-balances?include=leave_type&filter[user_id][]=";
  static const String applyLeaveEndPoint = "$baseUrl/leaves";
  static const String leaveHistoryEndPoint =
      "$baseUrl/leaves?include=leave_type,leave_approvals,user&sort=-id&filter[user_id][]=";
  static const String changeLanguage = "$baseUrl/user-preferences/";
  static const String kAuthenticationHeader = "authentication";
  static const String kContentType = "Content-Type";
  static const String kAccept = "Accept";
  static const String kBearer = "Bearer";
  static const String kApplictionVndApiJson = "application/vnd.api+json";
  static const String kRefreshtoken = "refresh_token";
  static const String kAuthorizationToken = "Authorization";
}
