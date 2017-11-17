//
//  REST.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 11/17/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class REST {
    
    private static let URL_BASE_CLIENTE = "https://sky-exercise.herokuapp.com/api/"
    
    private static let URL_MOVIES = "movies"
    
    static func getMovies(callback: @escaping (DataResponse<Any>) -> ()) {
        
        let url = URL_BASE_CLIENTE + URL_MOVIES
    
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            callback(response)
            
        })
        
    }
    
    static func downloadImage(url: String,callback: @escaping (DataResponse<UIImage>) -> ()) {
        
        Alamofire.request(url).responseImage(completionHandler: { response in
            
            if response.result.value != nil {
                callback(response)
            }
            
        })
    }
}

