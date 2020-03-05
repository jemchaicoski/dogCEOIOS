//
//  AlamofireControllerViewController.swift
//  dogCEOIOS
//
//  Created by Jonathan on 05/03/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import os.log

class AlamofireViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var imagemview: UIImageView!
    
    @IBOutlet weak var TableView: dogTableViewCell!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return racas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "dogListCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? dogTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        return cell
    }
    
    var racas :[String] = []
    var listType = "raca"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allDogs()
        getImage(nome : "hound")
        subBreed(nome: "terrier")
        requestImagem()
    }
    func allDogs(){
        let url = "https://dog.ceo/api/breeds/list/all"
        Alamofire.request(url).validate().responseJSON {response in
            if let array = response.result.value as? [String : Any] {
                if let listaDogs = array["message"] as? [String : Any]{
                    for (raca, subracas) in listaDogs {
                        
                    }
                }
            }
        }
    }
    
    
    func getImage(nome : String){
        let url = "https://dog.ceo/api/breed/\(nome)/images/random"
        Alamofire.request(url).validate().responseImage{response in
            if let dictionary = response.result.value as? [String : Any] {
                let imgUrl = dictionary["message"]
                //print(imgUrl)
            }
        }
        
    }
    
    func subBreed(nome : String) {
        let url = "https://dog.ceo/api/breed/\(nome)/list"
        Alamofire.request(url).validate().responseJSON {response in
            if let array = response.result.value as? [String : Any]{
                if let listaDogs = array ["message"] as? [String : Any]{
                    for (subracas) in listaDogs {
                        print(subracas)
                    }
                }
            }
        }
    }
    func urltodasasracas(_sender: AnyObject){
        let url = URL(string: "http://dog.ceo/api/breeds/list/all")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.canOpenURL(url)
        }
    }
    func urlsubracas(_sender: AnyObject){
        let url = URL(string: "http://dog.ceo/api/breed/hound/list")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.canOpenURL(url)
        }
    }
    func urlimagem(_sender: AnyObject){
        let url = URL(string: "http://images.dog.veo/breeds/whippet/n02091134_4273.jpg")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.canOpenURL(url)
        }
    }
    func loadSampleRacas(){
        switch listType{
        case "breeds" :
            racas += ["urltodasasracas"]
            
        case "breed" :
            racas += ["urlsubRacas"]
            
        case "hound":
            racas += ["urlimagem"]
        default:
            print("Escolha uma opção existente!")
            
        }
    }
    func requestImagem(){
        let imageURL = "https://images.dog.ceo/breeds/shiba/shiba-7.jpg"
        Alamofire.request(imageURL)
            .responseImage() { response in
                if let image = response.result.value{
                    self.imagemview.image = image
                }
        }
    }
}





