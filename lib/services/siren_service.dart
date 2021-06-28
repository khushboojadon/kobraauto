
import 'package:kobraauto/models/sirens_model.dart';
import 'package:kobraauto/repository/siren_repo.dart';
import 'package:rxdart/rxdart.dart';

class SirenDataService{
  final SirenRepository _repository = SirenRepository();
  final BehaviorSubject _sirenListData  = BehaviorSubject<List<SirenDetails>>();
  BehaviorSubject<List<SirenDetails>> get $sirenListData => _sirenListData.stream;
  getListCall() async{
    List<SirenDetails> list = await _repository.loginCall();
    if(list.length > 0) {
      _sirenListData.sink.add(list);
    }
    print('hello service ------------ $list');
  }
  void dispose(){
    _sirenListData.close();
  }
}