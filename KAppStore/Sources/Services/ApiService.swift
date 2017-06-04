//
//  AppService.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import Foundation

struct ApiService {
  
  /// 금융 카테고리 무료 앱 순위 가져오기
  static func appList(completion: @escaping ([App]) -> ()) {
    let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        print("Failed to load app list: ", error)
        return
      }
      
      do {
        guard let data = data else { return }
        
        let json = try (JSONSerialization.jsonObject(with: data, options: .mutableContainers))
        
        guard let result = json as? [String: Any],
          let feed = result["feed"] as? [String: Any],
          let entry = feed["entry"] as? [[String: Any]] else { return }
        
        var apps = [App]()
        for dictionary in entry {
          let app = App(dictionary: dictionary)
          apps.append(app)
        }
        
        DispatchQueue.main.async {
          completion(apps)
        }
        
      } catch let jsonError {
        print(jsonError)
      }
    }.resume()
  }
  
  static func appDetail() {
    
  }
}




//
//["im:artist": {
//  attributes =     {
//    href = "https://itunes.apple.com/kr/developer/viva-republica/id446370314?mt=8&uo=2";
//  };
//  label = "Viva Republica";
//  }, "im:contentType": {
//    attributes =     {
//      label = "\Uc571";
//      term = Application;
//    };
//  }, "link": {
//    attributes =     {
//      href = "https://itunes.apple.com/kr/app/toss-%ED%86%A0%EC%8A%A4-%EC%86%A1%EA%B8%88%EC%9D%B4-%EC%89%AC%EC%9B%8C%EC%A7%84%EB%8B%A4/id839333328?mt=8&uo=2";
//      rel = alternate;
//      type = "text/html";
//    };
//  }, "summary": {
//    label = "\Ub180\Ub77c\Uc6b4 \Uac04\Ud3b8\Ud568.\n\Uc1a1\Uae08\Uc740 \Uc774\Uc81c Toss\Uc785\Ub2c8\Ub2e4.\n\n[\Ud604\Uc7ac \Uac00\Uc785 \Uac00\Ub2a5 \Uacc4\Uc88c]\n- \Uc6b0\Ub9ac\n- KB\Uad6d\Ubbfc\n- NH\Ub18d\Ud611\n- \Uc2e0\Ud55c\n- KEB\Ud558\Ub098\Uc740\Ud589 (\Uad6c \Uc678\Ud658\Uc740\Ud589 \Ud3ec\Ud568)\n- IBK\Uae30\Uc5c5\Uc740\Ud589\n- \Uc6b0\Uccb4\Uad6d\n- \Ubd80\Uc0b0\Uc740\Ud589\n- \Uacbd\Ub0a8\Uc740\Ud589\n- \Uad11\Uc8fc\Uc740\Ud589\n- \Uc804\Ubd81\Uc740\Ud589\n- \Uc0c8\Ub9c8\Uc744\Uae08\Uace0\n- \Uc2e0\Ud611\n- SC\n- \Ub300\Uad6c\Uc740\Ud589\n- KDB\Uc0b0\Uc5c5\Uc740\Ud589\n- \Uc81c\Uc8fc\Uc740\Ud589\n- \Uc218\Ud611\n- NH\Ud22c\Uc790\Uc99d\Uad8c\n- \Ub300\Uc2e0\Uc99d\Uad8c\n- \Uc9c0\Uc6d0 \Uc740\Ud589\Uc740 \Uacc4\Uc18d \Ucd94\Uac00\Ub418\Uba70, \Uc704 \Uacc4\Uc88c\Uac00 \Uc5c6\Uc5b4\Ub3c4 Toss\Uc758 \Uc1a1\Uae08\Uc744 \Uccb4\Ud5d8\Ud574\Ubcfc \Uc218 \Uc788\Uc2b5\Ub2c8\Ub2e4.\n\n- \Uad6d\Ub0b4 \Ubaa8\Ub4e0 \Uc740\Ud589\Uacfc \Uc99d\Uad8c\Uc0ac\Uc758 \Uacc4\Uc88c\Ub85c \Ubcf4\Ub0bc \Uc218 \Uc788\Uc2b5\Ub2c8\Ub2e4.\n\n[\Ucc28\Uc6d0\Uc774 \Ub2e4\Ub978 \Uac04\Ud3b8\Ud568]\n- \Ubcf4\Ub0bc \Uae08\Uc561, \Ubc1b\Ub294 \Uc0ac\Ub78c, \Uc554\Ud638\Ub9cc \Uc785\Ub825\Ud558\Uba74 \Uc1a1\Uae08 \Uc644\Ub8cc!\n- \Uc774\Uc81c \Ub354 \Uc774\Uc0c1 \Uc1a1\Uae08\Uc744 \Uc704\Ud574 \Uacf5\Uc778\Uc778\Uc99d\Uc11c, \Ubcf4\Uc548\Uce74\Ub4dc, ActiveX\Uc640 \Uc528\Ub984\Ud560 \Ud544\Uc694\Uac00 \Uc5c6\Uc2b5\Ub2c8\Ub2e4.\n\n[\Uacc4\Uc88c\Ubc88\Ud638\Ub97c \Ubaa8\Ub974\Uc2dc\Ub098\Uc694? \Uc5f0\Ub77d\Ucc98\Ub85c \Uc1a1\Uae08\Ud558\Uc138\Uc694!]\n- \Ubc1b\Ub294 \Uc0ac\Ub78c\Uc758 \Uc804\Ud654\Ubc88\Ud638\Ub9cc \Uc120\Ud0dd\Ud558\Uba74 \Ubb38\Uc790 \Uba54\Uc2dc\Uc9c0\Ub97c \Ud1b5\Ud574 \Uc1a1\Uae08 \Uc644\Ub8cc!\n\n[\Uacc4\Uc88c\Ubc88\Ud638\Ub294 \Uc544\Ub294\Ub370 \Uc785\Ub825\Ud558\Uae30\Uac00 \Uadc0\Ucc2e\Uc73c\Uc2e0\Uac00\Uc694? 1\Ucd08\Uba74 \Ub429\Ub2c8\Ub2e4]\n- \Uacc4\Uc88c \Uc815\Ubcf4\Uac00 \Ud3ec\Ud568\Ub41c \Uba54\Uc2dc\Uc9c0\Ub97c \Ud1b5\Uc9f8\Ub85c \Ubcf5\Uc0ac\Ud558\Uba74,\n- Toss\Uac00 \Uacc4\Uc88c \Uc815\Ubcf4\Ub9cc \Uac78\Ub7ec\Ub0b4\Uc5b4 \Uc790\Ub3d9\Uc73c\Ub85c \Uc785\Ub825\Ud574\Ub4dc\Ub9bd\Ub2c8\Ub2e4.\n\n[\Ubc1b\Ub294 \Uc0ac\Ub78c\Uc740 Toss \Uc571 \Uc124\Uce58\Uac00 \Ud544\Uc694 \Uc5c6\Uc2b5\Ub2c8\Ub2e4]\n- \Uc571 \Uc124\Uce58 \Uc5c6\Uc774\Ub3c4 \Ubc1b\Ub294 \Uc0ac\Ub78c\Uc758 \Uacc4\Uc88c\Ub85c '\Uc989\Uc2dc' \Uc785\Uae08\Ub429\Ub2c8\Ub2e4.\n\n[\Ubb38\Uc758]\n- \Uce74\Uce74\Uc624\Ud1a1 > \Uce5c\Uad6c\Ucc3e\Uae30 > \Uc544\Uc774\Ub514 \Uac80\Uc0c9 > '@toss' \Ucc3e\Uae30 \n- 1599-4905";
//  }, "id": {
//    attributes =     {
//      "im:bundleId" = "com.vivarepublica.cash";
//      "im:id" = 839333328;
//    };
//    label = "https://itunes.apple.com/kr/app/toss-%ED%86%A0%EC%8A%A4-%EC%86%A1%EA%B8%88%EC%9D%B4-%EC%89%AC%EC%9B%8C%EC%A7%84%EB%8B%A4/id839333328?mt=8&uo=2";
//  }, "im:releaseDate": {
//    attributes =     {
//      label = "2014.03.27";
//    };
//    label = "2014-03-27T16:55:28-07:00";
//  }, "im:price": {
//    attributes =     {
//      amount = "0.00000";
//      currency = USD;
//    };
//    label = "\Ubc1b\Uae30";
//  }, "rights": {
//    label = "\U00a9 Viva Republica Co, Ltd";
//  }, "im:image": <__NSArrayM 0x61800004a9e0>(
//  {
//  attributes =     {
//  height = 53;
//  };
//  label = "http://is3.mzstatic.com/image/thumb/Purple117/v4/d3/6f/3e/d36f3e01-13b0-67ed-6697-45613ccb1e75/mzl.kludrleb.png/53x53bb-85.png";
//  },
//  {
//  attributes =     {
//  height = 75;
//  };
//  label = "http://is5.mzstatic.com/image/thumb/Purple117/v4/d3/6f/3e/d36f3e01-13b0-67ed-6697-45613ccb1e75/mzl.kludrleb.png/75x75bb-85.png";
//  },
//  {
//  attributes =     {
//  height = 100;
//  };
//  label = "http://is1.mzstatic.com/image/thumb/Purple117/v4/d3/6f/3e/d36f3e01-13b0-67ed-6697-45613ccb1e75/mzl.kludrleb.png/100x100bb-85.png";
//  }
//  )
//  , "im:name": {
//    label = "Toss \Ud1a0\Uc2a4 : \Uc1a1\Uae08\Uc774 \Uc26c\Uc6cc\Uc9c4\Ub2e4";
//  }, "category": {
//    attributes =     {
//      "im:id" = 6015;
//      label = "\Uae08\Uc735";
//      scheme = "https://itunes.apple.com/kr/genre/ios-%EA%B8%88%EC%9C%B5/id6015?mt=8&uo=2";
//      term = Finance;
//    };
//  }, "title": {
//    label = "Toss \Ud1a0\Uc2a4 : \Uc1a1\Uae08\Uc774 \Uc26c\Uc6cc\Uc9c4\Ub2e4 - Viva Republica";
//  }]
