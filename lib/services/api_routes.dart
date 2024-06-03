class ApiRoutes {
  ApiRoutes._();
  static ApiRoutes instance = ApiRoutes._();

  String baseUrl = 'https://allevents.in/api/index.php';
  String getlistendpoint = '/users/lists/get_list';
  String listupdateendPoint = '/users/lists/update';
}
