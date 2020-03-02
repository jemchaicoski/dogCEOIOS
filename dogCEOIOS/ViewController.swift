//
//  ViewController.swift
//  dogCEOIOS
//
//  Created by Jonathan on 27/02/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var listType = "raca";
    @IBOutlet weak var tableView: UITableView!
    
    var racas : [String] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    var subraca = [TableViewCell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleRacas();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // Substitua para suportar a edição da exibição da tabela.
    func tableView(_tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Exclua a linha da fonte de dados
            subraca.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Crie uma nova instância da classe apropriada, insira-a na matriz e adicione uma nova linha à visualização da tabela
            
        }
    }
    
    func loadSampleRacas() {
        switch listType {
            
        case "racas" :
                racas += ["Terrier", "Pastor", "raca 3"]
            
        case "subracas" :
                racas += ["subraca1","subraca2","subraca3"]
            
        case "favoritos" :
            racas += ["favorito1"]
            
        default :
            racas += ["Terrier", "Pastor", "boxer"]
        }
        
        
    }

}


