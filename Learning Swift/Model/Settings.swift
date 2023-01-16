//
//  Settings.swift
//  Learning Swift
//
//  Created by Марк Райтман on 16.01.2023.
//

import Foundation

//MARK: ENUM

//чтобы не запутаться в ключах или не совершить там ошибку (т.к. String), то создаём ENUM
enum KeysUserDefaults {
    static let settingsGame = "settingsGame"
}

//MARK: STRUCT

//создаём структуру для хранения настроек игры,
//также подписываем на протокол Codable, чтобы можно было закодировать и раскодировать данные от SettingsGame, которые уйдут в data
struct SettingsGame: Codable {
    var timerState: Bool //включен таймер или нет
    var timeForGame: Int //кол-во времени
}

//MARK: CLASS

//создаём класс для сохранения этих данных
class Settings {
    
    //создаём сиглтон для доступа к классу из любого файла (любой точки) приложения
    static var shared = Settings()
    
    //создадим дефолтные настройки, чтобы было что отображать на экране и чтобы не было краша в получении данных из UserDefaults
    private let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    
    //сохранение и полуеченние data в UserDefaults
    var currentSettings: SettingsGame {
        
        get {
            //декодируем и возвращаем данные из UserDefaults, которые были там сохранены
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                //кодируем defaultSettings, чтобы закинуть их в UserDefaults
                if let data = try? PropertyListEncoder().encode(defaultSettings ) {
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
                }
                return defaultSettings
            }
        }
        
        set {
            //кодируем данные для записи в UserDefaults, которые пришли
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
            
            
        }
    }
    
    //создаём функцию для обнуления настроек до стандартных
    func resetSetting() {
        currentSettings = defaultSettings
    }
    
}
