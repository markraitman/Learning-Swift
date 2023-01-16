//
//  SelectTimeViewController.swift
//  Learning Swift
//
//  Created by Марк Ромашков on 12.01.2023.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
//MARK: переменные
    
    //создаём пустой массив для заполнения его цифрами от SettingsTimeViewController
    var data: [Int] = []
    
    //создаём аутлет нашей тейбл вью, чтобы далее работать с ней
    @IBOutlet weak var tableView: UITableView! {
        
        //указываем источник данных (datasource) для tableView
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
        }
    }
    
//MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: extension UITableViewDataSource, UITableViewDelegate

    //создаём расширение для главного контроллера SelectTimeViewController, наследуясь от UITableViewDataSource, обозначив источник данных для tableView
    //также добавляем UITableViewDelegate, чтобы взаимодействовать с ячейкой (нажимать, удалять и т.д.)
extension SelectTimeViewController: UITableViewDataSource, UITableViewDelegate {
    
    //создаём шаблоны ячейки:
    
    //1) tableView numberOfRowsInSection - количество строк (полосок) в нашей секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //возвращаем столько строчек, сколько элементов приходит в data
        return data.count
    }
    
    //2) tableView cellForRowAt - создаём ячейку с определённым именем, кот. указали в storyboard
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        
        //настраиваем текст в textLabel ячейки, передавая в неё значения из приходящей data по каждому индексу строки и преобразовывая в String, т.к. data: [Int]
        cell.textLabel?.text = String(data[indexPath.row ])
        return cell
    }
    
    //функция "выбор строки по индекс-пути" от UITableViewDelegate для взаимодействия с ячейкой
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //устанавливаем взаимодействие и анимацию выбора ячейки по индекс-пути
        tableView.deselectRow(at: indexPath, animated: true)
        
        //выбираем настройку и кладём значение в timeForGame
        Settings.shared.currentSettings.timeForGame = data[indexPath.row]
        
        //после выбора возвращаемся назад на предыдущий экран (ViewController)
        navigationController?.popViewController(animated: true)
        
//        //сохраняем данные ячейки в хранилище UserDefaults (оно работает по принципу "ключ-значение")
//        UserDefaults.standard.setValue(data[indexPath.row], forKey: "timeForGame")
//
//        //вытаскиваем данные из хранилища UserDefaults
//        UserDefaults.standard.integer(forKey: "timeForGame")
    }
}
