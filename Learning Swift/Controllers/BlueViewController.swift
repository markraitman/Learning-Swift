//
//  BlueViewController.swift
//  Learning Swift
//
//  Created by Марк Ромашков on 10.01.2023.
//

import UIKit

class BlueViewController: UIViewController {
    
    var textForLabel = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = textForLabel 
    }
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBAction func goToGreenController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "greenVC")
        vc.title = "Зелёный"
        self.navigationController?.pushViewController(vc, animated: true )
    }
    
}
