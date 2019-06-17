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
    
    var id: String = ""
    var title: String = ""
    var overview: String = ""
    var duration: String = ""
    var release_year: String = ""
    var cover_url: String = ""
    
    override init() {
        
    }
    
    init(json: JSON) {
        
        self.id = json["id"].string ?? ""
        self.title = json["title"].string ?? ""
        self.overview = json["overview"].string ?? ""
        self.duration = json["duration"].string ?? ""
        self.release_year = json["release_year"].string ?? ""
        self.cover_url = json["cover_url"].string ?? ""
        
    }

}
