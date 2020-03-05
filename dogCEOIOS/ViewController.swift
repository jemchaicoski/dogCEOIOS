//
//  ViewController.swift
//  dogCEOIOS
//
//  Created by Jonathan on 27/02/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit
import Alamofire
import os.log


class ViewController: UIViewController {

    var racas :[String] = []
    var listType = "raca"
    
    
    @IBOutlet var TableView: UIView!
    
    @IBOutlet weak var imagemview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allDogs()
        
        getImage(nome : "hound")
        
        subBreed(nome: "breed")
    }
    
    
    func allDogs(){
         let url = "https://dog.ceo/api/breeds/list/all"
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
        let url = "https://dog.ceo/api/breed/\(nome)/list"
        Alamofire.request(url).validate().responseJSON {response in
            if let array = response.result.value as? [[String : Any]] {
                for item in array {
                    let description = item["dog"] as? String
                    print(description)
                }
            }
        }
    }
    func urltodasasracas(_sender: AnyObject){
        let url = URL(string: "http://dog.ceo/api/breeds/list/all")!
        if UIApplication.shared.canOpenURL(url){
        UIApplication.shared.openURL(url)
        }
    }
    func urlsubracas(_sender: AnyObject){
        let url = URL(string: "http://dog.ceo/api/breed/hound/list")!
        if UIApplication.shared.canOpenURL(url){
        UIApplication.shared.openURL(url)
    }
  }
    func urlimagem(_sender: AnyObject){
        let url = URL(string: "http://images.dog.veo/breeds/whippet/n02091134_4273.jpg")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.openURL(url)
    }
  }
    func loadSampleRacas(){
        switch listType{
        case "Raças" :
            racas += ["urltodasasracas"]
            
        case "subracas" :
            racas += ["urlsubRacas"]
       
        case "Imagems":
            racas += ["urlimagem"]
        default:
            print("Escolha uma opção existente!")
     
        }
  }
}
