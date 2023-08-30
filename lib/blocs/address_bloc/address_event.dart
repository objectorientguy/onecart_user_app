abstract class AddressEvents {}

class FetchAddress extends AddressEvents {}

class EditAddress extends AddressEvents {
  final Map saveAddress;
  final int addressId;

  EditAddress({required this.addressId, required this.saveAddress});
}

class AddAddress extends AddressEvents {
  final Map addAddress;
  // final int addressId;

  AddAddress({required this.addAddress});
}
