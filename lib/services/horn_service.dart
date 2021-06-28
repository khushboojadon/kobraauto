  import 'package:kobraauto/models/horn_model.dart';
import 'package:kobraauto/repository/horn_repo.dart';
import 'package:rxdart/rxdart.dart';

class HornDataService{
  final HornRepository _repository = HornRepository();
  final BehaviorSubject _hornListData = BehaviorSubject<List<HornDetails>>();
  BehaviorSubject<List<HornDetails>> get $hornListData => _hornListData.stream;
  getListCall() async{
  List<HornDetails> list = await _repository.loginCall();
  List<HornDetails> emptylist = [];
  if(list.length > 0) {
    _hornListData.sink.add(emptylist);
    _hornListData.sink.add(list);
  }
  print('hello service ------------ $list');
  }
  void dispose(){
    _hornListData.close();
  }
  }