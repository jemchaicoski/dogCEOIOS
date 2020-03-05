//
//  LaminFire.swift
//  dogCEOIOS
//
//  Created by Jonathan on 04/03/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class LaminFire {
    
    func requestImage() {
        
        
        
       Alamofire.request("https://dog.ceo/api/breed/\("nome")/images/random").responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
            }
        }
        
    }
}


