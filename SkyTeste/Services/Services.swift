//
//  Services.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 14/06/19.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Services {
    
    static let URL_BASE_CLIENTE = "https://sky-exercise.herokuapp.com/api/"
    static let URL_MOVIES = "Movies"
    
    static func getMovies(onComplete: @escaping ([Movie]) -> ()) {
        
        let url = URL_BASE_CLIENTE + URL_MOVIES
    
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            var listMovies: [Movie] = []
            
            if let resultData = response.data {
                
                let jsonObject = try! JSON(data: resultData)
                
                if let arrayMovies = jsonObject.arrayObject {
                    for movieObject in arrayMovies {
                        let movie = Movie(json: JSON(movieObject))
                        listMovies.append(movie)
                    }
                    onComplete(listMovies)
                }
                onComplete(listMovies)
            }
            
        })
        
    }
    
}

