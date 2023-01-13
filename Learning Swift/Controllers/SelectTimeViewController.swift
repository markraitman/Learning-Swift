//
//  SelectTimeViewController.swift
//  Learning Swift
//
//  Created by Марк Ромашков on 12.01.2023.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    //создаём аутлет нашей тейбл вью, чтобы далее работать с ней
    @IBOutlet weak var tableView: UITableView! {
        
        //указываем источник данных (datasource) для tableView
        didSet {
            tableView?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
//создаём расширение для главного контроллера SelectTimeViewController, наследуясь от UITableViewDataSource, обозначив источник данных для tableView
extension SelectTimeViewController: UITableViewDataSource {
    
    //создаём шаблоны ячейки:
    
    //1) tableView numberOfRowsInSection - количество строк (полосок) в нашей секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    //2) tableView cellForRowAt - создаём ячейку с определённым именем, кот. указали в storyboard
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        return cell
    }
}
