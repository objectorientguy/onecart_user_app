abstract class AddressEvents {}

class FetchAddress extends AddressEvents {}

class EditAddress extends AddressEvents {
  final Map saveAddress;

  EditAddress({required this.saveAddress});
}
