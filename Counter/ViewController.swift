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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        historyTextView.text = "История изменений:" //обращаюсь не ко всему объекту UITextView, а только к его содержимому — тексту внутри (.text)
    }

    @IBAction func plusButton(_ sender: UIButton) { //
        cnt += 1
        updateLabel()
        addHistoryEntry(change: "+1")
    }
    
    
    @IBAction func minusButton(_ sender: UIButton) {
        if cnt > 0 {
            cnt -= 1
            updateLabel()
            addHistoryEntry(change: "-1")
        } else {
            addHistoryEntry(change: "Попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        cnt = 0
        updateLabel()
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

