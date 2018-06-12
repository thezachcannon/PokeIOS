//
//  ViewController.swift
//  Hello World
//
//  Created by Zach Cannon on 6/11/18.
//  Copyright © 2018 Zach Cannon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var counter : Int = 1;
    struct Pokemon {
        let sprite: String
    }
    @IBOutlet weak var dexImage: UIImageView!
    @IBOutlet weak var clickMe: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func clickMePressed(_ sender: Any) {
        clickMe.isEnabled = false
            Alamofire.request("https://pokeapi.co/api/v2/pokemon/" + String(counter)).responseData {
                response in
                let json = JSON(response.result.value!)
                let url = URL(string: json["sprites"]["front_default"].stringValue)
                let data = NSData(contentsOf: url!)
                let image = UIImage(data : data! as Data)
                self.dexImage.image = image
                self.nameLabel.text = json["name"].stringValue.capitalized
                self.counter += 1
                self.clickMe.isEnabled = true
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

