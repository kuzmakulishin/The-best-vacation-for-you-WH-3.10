//
//  QuestionViewController.swift
//  The best vacation for you WH 3.10
//
//  Created by Kuzma on 16/01/2019.
//  Copyright © 2019 Kuzma Kulishin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    // вопрос, который выбран у нас
    var questionIndex = 1
    
    var questions: [Question] = [
        
        Question(
            text: "Какой отдых вы предпочитаете?",
            type: .single,
            answers: [
           Answer(text: "Тусовка", type: .bar),
           Answer(text: "Солнечный", type: .bitch),
           Answer(text: "Активный", type: .sport),
           Answer(text: "Домашний", type: .home),]
        ),
    
        Question(
            text: "Как вам нравится отдыхать?",
            type: .multiple,
            answers: [
                Answer(text: "В компании друзей", type: .bar),
                Answer(text: "Максимальный релакс", type: .bitch),
                Answer(text: "Активный отдых", type: .sport),
                Answer(text: "Побыть одному", type: .home),]
        ),
        
        Question(
            text: "на сколько вам нравится активный отдых?",
            type: .ranged,
            answers: [
                Answer(text: "скорее да", type: .bar),
                Answer(text: "скорее нет", type: .bitch),
                Answer(text: "очень нравится", type: .sport),
                Answer(text: "ненавижу", type: .home),]
        )
        
        
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        let question = questions[questionIndex]
        
        
        switch question.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
