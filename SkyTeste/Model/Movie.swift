//
//  Movie.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 11/17/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class Movie: NSObject {
    
    var id: String?
    var title: String?
    var overview: String?
    var duration: String?
    var release_year: String?
    var cover_url: String?
    
    override init() {
        
    }
    
    init(json: JSON) {
        
        self.id = json["id"].stringValue
        self.title = json["title"].stringValue
        self.overview = json["overview"].stringValue
        self.duration = json["duration"].stringValue
        self.release_year = json["release_year"].stringValue
        self.cover_url = json["cover_url"].stringValue
        
    }

}
