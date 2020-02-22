//
//  NetworkingInterface.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit
import Alamofire
// NetWork interface class to request service API using Alamofire
class NetworkRequest{
    func Request(url : String ,method: HTTPMethod, parameters: [String : Any]?, headers: [String: String]?, completionHundler: @escaping (AFDataResponse<Any>?,ErrorHandler?)->Void){
        print (url)
        AF.request(url, method: method, parameters: parameters ?? [String: Any](),encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse) in
            switch(response.result) {
            case .success(let value):
                print(value)
                let temp = response.response?.statusCode ?? 400
                print(temp)
                if temp >= 300 {
                    do {
                        let err = try JSONDecoder().decode(ErrorHandler.self, from: response.data!)

                        print(err.message ?? "")
                        completionHundler(nil, err)
                    }catch{
                        print(error)
                    }
                }else{
                    print(response.data!)
                    completionHundler(response,nil)
                }
            case .failure(_):
                let lockString = NSLocalizedString("Something went wrong please try again later", comment: "حدث خطأ برجاء اعادة المحاولة")
                print(lockString)
                completionHundler(nil,nil)
                break
            }
        }
    }
}
