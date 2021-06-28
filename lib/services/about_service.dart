
import 'package:kobraauto/models/aboutus_model.dart';
import 'package:kobraauto/repository/aboutus_repo.dart';
import 'package:rxdart/rxdart.dart';

class AboutService{
  final AboutUsRepository _repository =   AboutUsRepository();
  final BehaviorSubject _aboutData  = BehaviorSubject<AboutUsModel>();
  BehaviorSubject<AboutUsModel> get $aboutData => _aboutData.stream;
  getListCall() async{
    AboutUsModel aboutUsModel = await _repository.getAbout();
    if(aboutUsModel != null) {
      _aboutData.sink.add(aboutUsModel);
    }
    print('hello service ------------ $aboutUsModel');
  }
  void dispose(){
    _aboutData.close();
  }
}