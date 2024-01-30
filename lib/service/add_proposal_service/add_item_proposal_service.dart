import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';
import '../../model/Add_proposal/add_item_proposal_response.dart';
import '../../model/Add_proposal/get_proposal_related_model.dart';
import '../../model/Add_proposal/proposal_related_model.dart';

class AddItemProposalService {
  Future addItemProposalService( ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposalitem",
        
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return AddItemProposalModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
