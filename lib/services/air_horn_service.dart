import 'package:kobraauto/models/airhorn_model.dart';
import 'package:kobraauto/models/horn_model.dart';
import 'package:kobraauto/repository/air_horn_repo.dart';
import 'package:kobraauto/repository/horn_repo.dart';
import 'package:rxdart/rxdart.dart';

class AirHornDataService{
  final AirHornRepository _repository = AirHornRepository();
  final BehaviorSubject _airHornListData = BehaviorSubject<List<AirHornDetails>>();
  BehaviorSubject<List<AirHornDetails>> get $airHornListData => _airHornListData.stream;
  getListCall() async{
    List<AirHornDetails> list = await _repository.loginCall();
    if(list.length > 0) {
    _airHornListData.sink.add(list);
    }
    print('hello service ------------ $list');
  }
  void dispose(){
    _airHornListData.close();
  }
}