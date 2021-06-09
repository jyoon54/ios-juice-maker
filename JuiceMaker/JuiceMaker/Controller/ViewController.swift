//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruitStore = FruitStore(defaultStock: 10)
        let juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        strawberryLabel?.text =  "\(fruitStore.strawberryStock)"
        bananaLabel?.text = "\(fruitStore.bananaStock)"
        pineappleLabel?.text = "\(fruitStore.pineappleStock)"
        kiwiLabel?.text = "\(fruitStore.kiwiStock)"
        mangoLabel?.text = "\(fruitStore.mangoStock)"
    }
    
    

    @IBAction func orderDdalbaJuice(_ sender: UIButton) {
        //재고확인
        
        //제조
    }
    
    @IBAction func orderMangkiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        
    }

    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        
    }
}

