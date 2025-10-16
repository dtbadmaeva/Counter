//
//  ViewController.swift
//  Counter
//
//  Created by Димида Бадмаева on 16/10/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!
    var cnt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }

    @IBAction func plusButton(_ sender: UIButton) {
        cnt += 1
        updateLabel()
    }
    
    
    @IBAction func minusButton(_ sender: UIButton) {
        if cnt > 0 {
            cnt -= 1
            updateLabel()
        }
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        cnt = 0
        updateLabel()
    }
        
    func updateLabel() {
        counter.text = "\(cnt)"
    }


}

