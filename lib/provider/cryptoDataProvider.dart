import 'package:crypto_exchange_flutter/network/ApiProvider.dart';
import 'package:flutter/cupertino.dart';

import '../models/CryptoModels/AllCryptoModel.dart';
import '../network/responsModel.dart';

class cryptoDataProvider extends ChangeNotifier{
  apiProvider apiProver = apiProvider();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;

  GetopMarketCapData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProver.getTopMarketCap();

      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      }else{
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
  GetopgainersData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProver.getTopgainers();

      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      }else{
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
  GetoplosersData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await apiProver.getToplosers();

      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      }else{
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
  }
