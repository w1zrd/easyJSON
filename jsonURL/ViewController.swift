//
//  ViewController.swift
//  jsonURL
//
//  Created by Михалев Александр on 05/04/2018.
//  Copyright © 2018 RP Team. All rights reserved.
//

import UIKit

struct Country  : Decodable {
    let name    : String
    let capital : String
    let region  : String
}

class ViewController: UIViewController {

    var counties = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: make a thread
        let jsonURL = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: jsonURL)

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.counties = try JSONDecoder().decode([Country].self, from: data!)
                for eachCountry in self.counties {
                    print("The capital of \(eachCountry.name) is \(eachCountry.capital)")
                }
            }
            catch {
                print("error")
            }
        }.resume()
    }
}
