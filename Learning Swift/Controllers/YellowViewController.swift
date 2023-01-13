//
//  YellowViewController.swift
//  Learning Swift
//
//  Created by Марк Ромашков on 10.01.2023.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        //вызывается первым когда VC уже прошёл инит
        //создаётся один раз при создании
        super.viewDidLoad()
        print("YellowViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //вызывается когда экран вот-вот появится
        //отличное место для вызова функции обнолвений, т.к. вызывается каждый раз при появлении экрана
        //создаётся каждый раз
        super.viewWillAppear(animated)
        print("YellowViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //вызывается когда экран только-только отобразился
        //отличное место для вызова различных анимаций или ресурсоёмких процессов
        super.viewDidAppear(animated)
        print("YellowViewController viewDidAppear")
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //вызывается когда экран будет скрыт
        super.viewWillDisappear(animated)
        print("YellowViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //вызывается когда экран уже скрылся и будет уничтожен (конечно если на него нет strong ссылок)
        super.viewDidDisappear(animated)
        print("YellowViewController viewDidDisappear")
    }
    
    deinit {
        //вызывается когда экземпляр класса уничтожается
        print("YellowViewController deinit")
    }
    
    
    
    
    @IBAction func goToBlueController(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToBlue":
            if let blueVC = segue.destination as? BlueViewController {
                blueVC.textForLabel = "Test message"
            }
        default:
            break
        }
    }
    
}
