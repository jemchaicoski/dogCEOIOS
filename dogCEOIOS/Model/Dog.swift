//
//  Dog.swift
//  dogCEOIOS
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import Foundation
import UIKit
class Dog: NSObject, NSCoding {
    //Mark: Properties
    var raca: String
    var pai: String? //caso exista um pai, se trata-rá de uma sub raça
    var favorito: Bool = false
    var imagem: UIImage?
    
    //MARK: Initialization
    init(raca: String!, pai: String?, favorito: Bool!) {
        
        // Initialize stored properties.
        self.raca = raca
        self.pai = pai
        self.favorito = favorito
    }

    //Mark: Coding
    
    struct PropertyKey {
        static let raca = "raca"
        static let pai = "pai"
        static let favorito = "favorito"
        
    }
    convenience required init?(coder aDecoder: NSCoder) {
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let raca = aDecoder.decodeObject(forKey: PropertyKey.raca)as? String
        
        let pai = aDecoder.decodeObject(forKey: PropertyKey.pai)as? String
        
        let favorito = aDecoder.decodeBool(forKey: PropertyKey.favorito)as? Bool
        
        // Must call designated initializer.
        self.init(raca: raca, pai: pai, favorito: favorito)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(raca, forKey: PropertyKey.raca)
        aCoder.encode(pai, forKey: PropertyKey.pai)
        aCoder.encode(favorito, forKey: PropertyKey.favorito)
    }
    
    
}
