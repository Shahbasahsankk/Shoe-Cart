import 'package:e_commerce_app/model/address/address_screen_enum_model.dart';

class AddNewAddressArguemnetModel {
  final String? addressId;
  final AddressScreenEnum addressScreenCheck;

  AddNewAddressArguemnetModel({
    required this.addressScreenCheck,
    this.addressId,
  });
}
