import 'networkEngine.dart';

class GetDataService {
  Future<bool> isDataUpdated() async {
    String endpoint;
    bool status;
    final response = await NetworkEngine().dio.post(endpoint, data: {});
    status = response.data['status'];
    return status;
  }

  Future<bool> getData() async {
    String endpoint;
    bool status;
    final response = await NetworkEngine().dio.get(endpoint);
    status = response.data['status'];
    return status;
  }
}
