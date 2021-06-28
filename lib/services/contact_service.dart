
import 'package:kobraauto/models/contactus_model.dart';
import 'package:kobraauto/repository/contactus_repo.dart';
import 'package:rxdart/rxdart.dart';

class ContactService{
  final ContactUsRepository _repository =  ContactUsRepository();
  final BehaviorSubject _contactData  = BehaviorSubject<ContactUsModel>();
  BehaviorSubject<ContactUsModel> get $contactData => _contactData.stream;
  getListCall() async{
    ContactUsModel contactUsModel = await _repository.getContact();
    if( contactUsModel!= null) {
      _contactData.sink.add(contactUsModel);
    }
    print('hello service ------------ $contactUsModel');
  }
  void dispose(){
    _contactData.close();
  }
}