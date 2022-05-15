class ProviderDetails {
  String? providerProfileImage;
  String? providerName;
  String? providerJobTitle;
  double? providerRating;
  bool? isUserActive=false;
  String? userSummaryDetails;
  String? providerEmail;
  String? providerPhoneNumber;
  String? providerMemberSince;

  ProviderDetails(
      {this.providerProfileImage,this.providerEmail, this.isUserActive, this.providerJobTitle, this.providerMemberSince, this.providerName, this.providerPhoneNumber, this.providerRating, this.userSummaryDetails});
}