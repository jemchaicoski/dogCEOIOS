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
        loadSampleDog()
        updateDogs()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "dogTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell  else {
            fatalError("The dequeued cell is not an instance of BarTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let dog = dogs[indexPath.row]
        
        cell.dogName.text = dog.raca
        //cell.dogImage.image
        buttonFavoriteAux(dog: dog, cell: cell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    @IBAction private func updateDogs(){
        dogs.sort(by:{$0.raca < $1.raca})
        tableView.reloadData()
    }
    
    @IBAction func setButtonFavoriteState(dog: Dog, cell: TableViewCell){
        dog.favorito = !dog.favorito
        buttonFavoriteAux(dog: dog, cell: cell)
    }
    
    func buttonFavoriteAux(dog: Dog, cell: TableViewCell){
        let star : UIImage = dog.favorito ? UIImage(named:"filledStar")! : UIImage(named : "emptyStar")!
        cell.dogFavorite.setImage(star, for: .selected)
        cell.dogFavorite.setImage(star, for: .normal)
    }
    
    func loadSampleDog(){
        let dog1 = Dog(raca: "aaaa",pai: nil, favorito: true)
        dogs.insert(dog1, at: 0)
    }
    

}

