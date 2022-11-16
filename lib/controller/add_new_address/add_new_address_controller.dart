import 'package:e_commerce_app/routes/rout_names.dart';
import 'package:e_commerce_app/service/geo_location/geo_location.dart';
import 'package:flutter/cupertino.dart';

class AddNewAddressProvider with ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseAndBuildingController =
      TextEditingController();
  final TextEditingController roadNameAreaColonyController =
      TextEditingController();
  bool homeSelected = true;
  bool loading = false;

  String? namesHouseandAreaValiator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length != 10) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String? pinCodeValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your pincode';
    } else if (value.length != 6) {
      return 'Please enter valid pincode';
    }
    return null;
  }

  void selectAddressType() {
    homeSelected = !homeSelected;
    notifyListeners();
  }

  void saveAddress(FormState currentState, BuildContext context) {
    if (currentState.validate()) {
      Navigator.of(context).pushReplacementNamed(RouteNames.addressScreen);
    }
  }

  Future<void> useMyLocation() async {
    loading = true;
    notifyListeners();
    await GeoLocationService().determinePosition().then((value) {
      if (value != null) {
        GeoLocationService()
            .getLocationAddress(value.latitude, value.longitude)
            .then((value) {
          if (value != null) {
            List a = value.region!.split(',').toList();
            pincodeController.text = value.postal.toString();
            cityController.text = value.city.toString();
            stateController.text = a[1];
            notifyListeners();
            loading = false;
            notifyListeners();
          } else {
            loading = false;
            notifyListeners();
          }
        });
      } else {
        loading = false;
        notifyListeners();
      }
    });
  }
}
