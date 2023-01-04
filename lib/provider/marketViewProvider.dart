
import 'package:crypto_exchange_flutter/models/CryptoModels/AllCryptoModel.dart';
import 'package:crypto_exchange_flutter/network/ApiProvider.dart';
import 'package:flutter/cupertino.dart';

import '../network/responsModel.dart';

class MarketViewProvider extends ChangeNotifier{
  apiProvider ApiProvider = apiProvider();
  late AllCryptoModel  dataFuture;
  late ResponseModel state;
  var response;


  GetCryptoData() async {
    state = ResponseModel.loading("is Loading...");
    try{
      response = await  ApiProvider.getAllCrypto();

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