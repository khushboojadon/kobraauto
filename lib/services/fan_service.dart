
import 'package:kobraauto/models/fans_model.dart';
import 'package:kobraauto/repository/fan_repo.dart';
import 'package:rxdart/rxdart.dart';

class FanDataService{
  final FanRepository _repository = FanRepository();
  final BehaviorSubject _fanListData  = BehaviorSubject<List<FanDetails>>();
  BehaviorSubject<List<FanDetails>> get $fanListData => _fanListData.stream;
  getListCall() async{
    List<FanDetails> list = await _repository.loginCall();
    if(list.length > 0) {
      _fanListData.sink.add(list);
    }
    print('hello service ------------ $list');
  }
  void dispose(){
    _fanListData.close();
  }
}