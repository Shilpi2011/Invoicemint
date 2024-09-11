class DashboardProgressResponse {
  DashboardProgressResponse({
    required this.totalInvoiceData,
    required this.paidInvoiceData,
    required this.unpaidInvoiceData,
    required this.overdueInvoiceData,
    this.totalAmountData,
    this.paidAmountData,
    this.unpaidAmountData,
    this.overdueAmountData,
  });

  final int totalInvoiceData;
  final int paidInvoiceData;
  final int unpaidInvoiceData;
  final int overdueInvoiceData;
  final double? totalAmountData;
  final double? paidAmountData;
  final double? unpaidAmountData;
  final double? overdueAmountData;

  factory DashboardProgressResponse.fromJson(Map<String, dynamic> json) {
    return DashboardProgressResponse(
      totalInvoiceData: json['totalInvoiceData'] as int? ?? 0,
      paidInvoiceData: json['paidInvoiceData'] as int? ?? 0,
      unpaidInvoiceData: json['unpaidInvoiceData'] as int? ?? 0,
      overdueInvoiceData: json['overdueInvoiceData'] as int? ?? 0,
      totalAmountData: (json['totalAmountData'] as num?)?.toDouble(),
      paidAmountData: (json['paidAmountData'] as num?)?.toDouble(),
      unpaidAmountData: (json['unpaidAmountData'] as num?)?.toDouble(),
      overdueAmountData: (json['overdueAmountData'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalInvoiceData'] = totalInvoiceData;
    _data['paidInvoiceData'] = paidInvoiceData;
    _data['unpaidInvoiceData'] = unpaidInvoiceData;
    _data['overdueInvoiceData'] = overdueInvoiceData;
    _data['totalAmountData'] = totalAmountData;
    _data['paidAmountData'] = paidAmountData;
    _data['unpaidAmountData'] = unpaidAmountData;
    _data['overdueAmountData'] = overdueAmountData;
    return _data;
  }
}
