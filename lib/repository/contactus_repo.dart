

import 'package:kobraauto/api_provider/contact_apiprovider.dart';
import 'package:kobraauto/models/contactus_model.dart';

class ContactUsRepository {
  final ContactApiProvider contactApiProvider = ContactApiProvider();

  Future<ContactUsModel> getContact() =>
      contactApiProvider.getContact();
}