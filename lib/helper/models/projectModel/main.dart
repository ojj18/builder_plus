class ProjectModel {
  String? projectClientName;
  String? projectLocation;
  String? projectMobileNumber;
  String? projectStartDate;
  String? projectValue;
  String? projectCreatedDate;

  ProjectModel({
    this.projectClientName,
    this.projectLocation,
    this.projectMobileNumber,
    this.projectStartDate,
    this.projectValue,
    this.projectCreatedDate,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectClientName = json['projectClientName'];
    projectLocation = json['projectLocation'];
    projectMobileNumber = json['projectMobileNumber'];
    projectStartDate = json['projectStartDate'];
    projectValue = json['projectValue'];
    projectCreatedDate = json['projectCreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['projectClientName'] = projectClientName;
    data['projectLocation'] = projectLocation;
    data['projectMobileNumber'] = projectMobileNumber;
    data['projectStartDate'] = projectStartDate;
    data['projectValue'] = projectValue;
    data['projectCreatedDate'] = projectCreatedDate;

    return data;
  }
}
