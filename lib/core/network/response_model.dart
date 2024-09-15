class ApiResponse {
  final int status;
  final String message;
  final dynamic data; // Adjust based on your API's actual data format

  ApiResponse({required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'], // You can create a separate model for 'data' if needed
    );
  }
}
