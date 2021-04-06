//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTitleLable: UILabel!
    
    var choosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
    }
        
        
    
}

// MARK: - Private Properties
extension ResultsViewController {
    private func getResult() {
        
        let rabbitPoint = choosenAnswers.filter({$0.type == AnimalType.rabbit}).count
        let catPoint = choosenAnswers.filter({$0.type == AnimalType.cat}).count
        let dogPoint = choosenAnswers.filter({$0.type == AnimalType.dog}).count
        let turtlePoint = choosenAnswers.filter({$0.type == AnimalType.turtle}).count
     
        let petsPoints = [rabbitPoint, catPoint, dogPoint, turtlePoint]
        let maxPoint = petsPoints.max()
        
        if let maximumPoints = maxPoint {
        switch maximumPoints {
        case rabbitPoint:
            resultLabel.text = "Вы - \(String(AnimalType.rabbit.rawValue))!";
            resultTitleLable.text = AnimalType.rabbit.definition
        case catPoint:
            resultLabel.text = "Вы - \(String(AnimalType.cat.rawValue))!";
            resultTitleLable.text = AnimalType.cat.definition
        case dogPoint:
            resultLabel.text = "Вы - \(String(AnimalType.dog.rawValue))!";
            resultTitleLable.text = AnimalType.dog.definition
        default:
            resultLabel.text = "Вы - \(String(AnimalType.turtle.rawValue))!";
            resultTitleLable.text = AnimalType.turtle.definition
        }
    }
        
    }
}
   
    
    



