//
//  ResultsViewController.swift
//  The best vacation for you WH 3.10
//
//  Created by Kuzma on 16/01/2019.
//  Copyright © 2019 Kuzma Kulishin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var findVacation: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonResult()
    }
    
    var answers: [Answer]! {
        didSet {
            print(#function, answers ?? "nil")
        }
    }
    
    
    func calculatePersonResult() {
        var frequencyOfAnswers: [VacationType: Int] = [:]
        let responseTypes = answers.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
    
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultLabel.text = "\(mostCommonAnswer.rawValue)"
        resultTextLabel.text = mostCommonAnswer.definition
        findVacation.text = mostCommonAnswer.linkVacation
    }
    
    

}
