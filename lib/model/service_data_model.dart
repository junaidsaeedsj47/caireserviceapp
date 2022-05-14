class ServiceModel {
  String? serviceImage;
  String? serviceName;
  String? servicePricing;
  double? serviceProviderRating;
  String? serviceProviderName;
  int? serviceDuration;
  String? descriptionOfService;
  int? serviceDiscount;

  ServiceModel(
      {this.serviceImage,
      this.serviceName,
      this.servicePricing,
      this.serviceProviderName,
      this.serviceProviderRating,
      this.serviceDuration,
      this.descriptionOfService,
      this.serviceDiscount});
}
