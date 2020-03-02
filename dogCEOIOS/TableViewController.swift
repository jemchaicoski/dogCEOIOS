//
//  ViewController.swift
//  dogCEOIOS
//
//  Created by Jonathan on 27/02/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dogs = [Dog]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "dogTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell  else {
            fatalError("The dequeued cell is not an instance of BarTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let dog = dogs[indexPath.row]
        
        cell.lblNomeDog.text = dog.nome!
        cell.ImagemDog.image = dog.foto!
        cell.ratingDog.rating = dog.rating!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bars.count
    }
    
    @IBAction private func updateDogs(){
        dogs.sort(by:{$0.nome! < $1.nome!})
        tableView.reloadData()
    }
    

}

