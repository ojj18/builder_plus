class ExpenseModel {
  int? id;
  int? expenseType;
  String? projectName;
  String? vendor;
  String? item;
  double? amount;
  double? billAmount;
  int? paymentType;
  String? notes;
  double? totalAmount;
  String? date;

  ExpenseModel({
    this.id,
    this.expenseType,
    this.projectName,
    this.vendor,
    this.item,
    this.amount,
    this.billAmount,
    this.paymentType,
    this.notes,
    this.totalAmount,
    this.date,
  });

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseType = json['expenseType'];
    projectName = json['projectName'];
    vendor = json['vendor'];
    item = json['item'];
    amount = json['amount'];
    billAmount = json['billAmount'];
    paymentType = json['paymentType'];
    notes = json['notes'];
    totalAmount = json['totalAmount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['expenseType'] = expenseType;
    data['projectName'] = projectName;
    data['vendor'] = vendor;
    data['item'] = item;
    data['amount'] = amount;
    data['billAmount'] = billAmount;
    data['paymentType'] = paymentType;
    data['notes'] = notes;
    data['totalAmount'] = totalAmount;
    data['date'] = date;

    return data;
  }
}
