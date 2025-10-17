//
//  ViewController.swift
//  Counter
//
//  Created by Димида Бадмаева on 16/10/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var historyTextView: UITextView! //«У меня в коде есть переменная historyTextView, которая указывает на текстовое поле на экране (UITextView)
    
    var cnt = 0
    
    /*
     – UserDefaults – системный класс iOS для простого постоянного хранилища «ключ → значение».
     – .standard – своство, общий (singleton) экземпляр UserDefaults именно для твоего приложения.
     – .integer(forKey: "ValueCounter") – метод чтения целого числа (Int) по ключу "ValueCounter".

     Что происходит пошагово:
     Открывается стандартное хранилище приложения.
     Ищется запись с ключом "ValueCounter" в кэше/файле Library/Preferences/<bundle>.plist.
     Если запись есть и там лежит число, оно возвращается.
     Если записи нет (первый запуск/опечатка в ключе/там не Int), метод вернёт 0 (дефолт для integer(forKey:)).
     Возвращённое число присваивается моей переменной cnt
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        cnt = UserDefaults.standard.integer(forKey: "ValueCounter")
        updateLabel()
        historyTextView.text = "История изменений:" //обращаюсь не ко всему объекту UITextView, а только к его содержимому — тексту внутри (.text)
    }

    /*
     .set(_:forKey:) — метод записи значения по строковому ключу.
     
     Что происходит пошагово:
     Берётся общий экземпляр хранилища: UserDefaults.standard.
     Метод set кладёт текущее значение переменной cnt (тип Int) в оперативный кэш UserDefaults под ключом "ValueCounter".
     Система помечает хранилище как изменённое и позже (автоматически) синхронизирует его с plist-файлом в песочнице приложения:
     Library/Preferences/<bundle-id>.plist.
     Отдельно вызывать synchronize() обычно не нужно.
     */
    @IBAction func plusButton(_ sender: UIButton) { //
        cnt += 1
        updateLabel()
        UserDefaults.standard.set(cnt, forKey: "ValueCounter")
        addHistoryEntry(change: "+1")
    }
    
    
    @IBAction func minusButton(_ sender: UIButton) {
        if cnt > 0 {
            cnt -= 1
            updateLabel()
            UserDefaults.standard.set(cnt, forKey: "ValueCounter")
            addHistoryEntry(change: "-1")
        } else {
            addHistoryEntry(change: "Попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        cnt = 0
        updateLabel()
        UserDefaults.standard.set(cnt, forKey: "ValueCounter")
        addHistoryEntry(change: "Значение сброшено")
    }
        
    /*
     cnt — это переменная в коде, которая хранит текущее число счётчика.
     Пример: cnt = 5

     counter — это метка (UILabel), элемент на экране, который показывает текст пользователю.
     Например, ты видишь на экране «5».
     */
    func updateLabel() {
        counter.text = "\(cnt)"
    }
    
    func addHistoryEntry(change: String) {
        let date = Date().formatted(date: .numeric, time: .standard)
        historyTextView.text += "\n\(date): \(change)" //обращаюсь не ко всему объекту UITextView, а только к его содержимому — тексту внутри (.text)
    }


    

}

