import 'package:parent_control/src/model/data/service_model.dart';

class ServiceUtil {
  ServiceModel getString(int id) {
    switch (id) {
      case 0:
        return ServiceModel(asset: 'instagram', text: 'Instagram');
      case 1:
        return ServiceModel(asset: 'tiktok', text: 'TikTok');
      case 2:
        return ServiceModel(asset: 'youtube', text: 'YouTube');
      case 3:
        return ServiceModel(asset: 'twitter', text: 'Twitter');
      case 4:
        return ServiceModel(asset: 'steam', text: 'Steam');
      case 5:
        return ServiceModel(asset: 'facebook', text: 'Facebook');
      default:
        return ServiceModel(asset: '', text: '');
    }
  }
  int getType(String asset){
    switch (asset){
      case 'instagram': return 0;
      case 'tiktok': return 1;
      case 'youtube': return 2;
      case 'twitter': return 3;
      case 'steam': return 4;
      case 'facebook': return 5;
      default: return -1;
    }
  }
}

final serviceUtil = ServiceUtil();
