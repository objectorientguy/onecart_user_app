abstract class AddressEvents {}

class FetchAddress extends AddressEvents {}

class EditAddress extends AddressEvents {
  final Map saveAddress;
  final int addressId;

  EditAddress({required this.addressId, required this.saveAddress});
}
