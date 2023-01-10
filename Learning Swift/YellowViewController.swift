//
//  YellowViewController.swift
//  Learning Swift
//
//  Created by Марк Ромашков on 10.01.2023.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func goToBlueController(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: nil)
    }
    
}
