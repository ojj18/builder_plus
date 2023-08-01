class VendorModel {
  String? vendorName;
  String? mobileNumber1;
  String? mobileNumber2;
  String? vendorAddress;
  String? category;
  String? vendorCreatedDate;
  

  VendorModel({
    this.vendorName,
    this.mobileNumber1,
    this.mobileNumber2,
    this.vendorAddress,
    this.category,
    this.vendorCreatedDate,
   
  });

  VendorModel.fromJson(Map<String, dynamic> json) {
    vendorName = json['vendorName'];
    mobileNumber1 = json['mobileNumber1'];
    mobileNumber2 = json['mobileNumber2'];
    vendorAddress = json['vendorAddress'];
    category = json['category'];
    vendorCreatedDate = json['vendorCreatedDate'];

    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['vendorName'] = vendorName;
    data['mobileNumber1'] = mobileNumber1;
    data['mobileNumber2'] = mobileNumber2;
    data['vendorAddress'] = vendorAddress;
    data['category'] = category;
    data['vendorCreatedDate'] = vendorCreatedDate;

    return data;
  }
}
