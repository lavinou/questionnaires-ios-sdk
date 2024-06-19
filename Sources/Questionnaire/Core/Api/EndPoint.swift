//
//  File.swift
//  
//
//  Created by Vincent Turnier on 6/18/24.
//

import Foundation

struct EndPoint {
    
    let path: String
    let method: RequestMethod
    var data: Encodable? = nil
    var scheme: String = "https"
    var host: String = "questionnaire-api.lavinou.com"
    
}
