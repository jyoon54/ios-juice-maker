//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum JuiceName: String {
	case strawberryJuiceName = "딸기쥬스"
	case bananaJuiceName = "바나나쥬스"
	case kiwiJuiceName = "키위쥬스"
	case ddalbaJuiceName = "딸바쥬스"
	case mangoKiwiJuiceName = "망고키위쥬스"
	case mangoJuiceName = "망고쥬스"
	case pineappleJuiceName = "파인애플쥬스"
}

enum Message: String {
	case orderSuccess = " 나왔습니다! 맛있게 드세요!"
	case outOfStock = "재료가 모자라요. 재고를 수정할까요?"
}

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
	let fruitStore = FruitStore(defaultStock: 10)
	var juiceMaker: JuiceMaker?
//	let secondView = SecondViewController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel?.text =  "\(fruitStore.strawberryStock)"
        bananaLabel?.text = "\(fruitStore.bananaStock)"
        pineappleLabel?.text = "\(fruitStore.pineappleStock)"
        kiwiLabel?.text = "\(fruitStore.kiwiStock)"
        mangoLabel?.text = "\(fruitStore.mangoStock)"
		
		juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
	func showOrderSuccessAlert(message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "네!", style: .default)

		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
	
//	func showAlert(message: String) {
//		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
////		let secondView = SecondViewController()
//		let yesAction = UIAlertAction(title: "예", style: .default) {[weak self](action) in present(self?.secondView, animated: true, completion: nil)}
//
//		let noAction = UIAlertAction(title: "아니오", style: .default) {(action) in }
//
//		alert.addAction(yesAction)
//		present(alert, animated: true, completion: nil)
//	}
	
//	case strawberryJuice(strawberryNeeded: Int = 16)
//	case bananaJuice(bananaNeeded: Int = 2)
//	case kiwiJuice(kiwiNeeded: Int = 3)
//	case pineappleJuice(pineappleNeeded: Int = 2)
//	case ddalbaJuice(strawberryNeeded: Int = 10, bananaNeeded: Int = 1)
//	case mangoJuice(mangoNeeded: Int = 3)
//	case mangoKiwiJuice(mangoNeeded: Int = 2, kiwiNeeded: Int = 1)
	
	
	func orderJuice(recipe: Recipe) {
		switch recipe {
		case let .strawberryJuice(strawberryNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .strawberry, number: strawberryNeeded)
			showOrderSuccessAlert(message: JuiceName.strawberryJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .bananaJuice(bananaNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .banana, number: bananaNeeded)
			showOrderSuccessAlert(message: JuiceName.bananaJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .kiwiJuice(kiwiNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .kiwi, number: kiwiNeeded)
			showOrderSuccessAlert(message: JuiceName.kiwiJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .pineappleJuice(pineappleNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .pineapple, number: pineappleNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .pineapple, number: pineappleNeeded)
			showOrderSuccessAlert(message: JuiceName.pineappleJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .ddalbaJuice(strawberryNeeded, bananaNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded),
				  fruitStore.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .strawberry, number: strawberryNeeded)
			fruitStore.consumeFruits(fruit: .banana, number: bananaNeeded)
			showOrderSuccessAlert(message: JuiceName.ddalbaJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .mangoJuice(mangoNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .mango, number: mangoNeeded)
			showOrderSuccessAlert(message: JuiceName.mangoJuiceName.rawValue + Message.orderSuccess.rawValue)
			
		case let .mangoKiwiJuice(mangoNeeded, kiwiNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded),
				  fruitStore.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded) else {
				return
			}
			fruitStore.consumeFruits(fruit: .kiwi, number: kiwiNeeded)
			fruitStore.consumeFruits(fruit: .mango, number: mangoNeeded)
			showOrderSuccessAlert(message: JuiceName.mangoKiwiJuiceName.rawValue + Message.orderSuccess.rawValue)
		}
	}
    @IBAction func orderDdalbaJuice(_ sender: UIButton) {
		let ddalbaRecipe = Recipe.ddalbaJuice()
		orderJuice(recipe: ddalbaRecipe)
    }
    
    @IBAction func orderMangkiJuice(_ sender: UIButton) {
		let mangoKiwiRecipe = Recipe.mangoKiwiJuice()
		orderJuice(recipe: mangoKiwiRecipe)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
		let strawberryJuiceRecipe = Recipe.strawberryJuice()
		orderJuice(recipe: strawberryJuiceRecipe)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
		let bananaJuiceRecipe = Recipe.bananaJuice()
		orderJuice(recipe: bananaJuiceRecipe)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
		let pineappleJuiceRecipe = Recipe.pineappleJuice()
		orderJuice(recipe: pineappleJuiceRecipe)
    }

    @IBAction func orderKiwiJuice(_ sender: UIButton) {
		let kiwiJuiceRecipe = Recipe.kiwiJuice()
		orderJuice(recipe: kiwiJuiceRecipe)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
		let mangoJuiceRecipe = Recipe.mangoJuice()
		orderJuice(recipe: mangoJuiceRecipe)
    }
}

