//
//  ViewController.swift
//  Counter
//
//  Created by Димида Бадмаева on 16/10/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        historyTextView.text = "История изменений:"
    }

    @IBAction func plusButton(_ sender: UIButton) {
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
        
    func updateLabel() {
        counter.text = "\(cnt)"
    }
    
    func addHistoryEntry(change: String) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())

            let newEntry = "\n\(dateString): \(change)"
            historyTextView.text += newEntry
        }


}

