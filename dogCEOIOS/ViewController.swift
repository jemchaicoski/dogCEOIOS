//
//  ViewController.swift
//  dogCEOIOS
//
//  Created by Jonathan on 27/02/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // POST
    let url = "https://dog.ceo/api/breeds/image/random"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allDogs()
        
        getImage(nome : "hound")
        
        subBreed(nome: <#T##String#>)
    }
    
    
    func allDogs(){
        Alamofire.request(url).validate().responseJSON {response in
            if let array = response.result.value as? [[String : Any]] {
            for item in array {
                let description = item["dog"] as? String
                print(description)
            }
        }
    }
}
    
    func getImage(nome : String){
        let url = "https://dog.ceo/api/breed/\(nome)/images/random"
        Alamofire.request(url).validate().responseJSON {response in
            if let dictionary = response.result.value as? [String : Any] {
               let imgUrl = dictionary["message"]
                print(imgUrl!)
            }
        }
        
    }
    
    func subBreed(nome : String) {
        let url = "https://dog.ceo/api/\(nome)/hound/list"
        Alamofire.request(url).validate().responseJSON {response in
            if let array = response.result.value as? [[String : Any]] {
                for item in array {
                    let description = item["dog"] as? String
                    print(description)
                }
            }
        }
    }
}

