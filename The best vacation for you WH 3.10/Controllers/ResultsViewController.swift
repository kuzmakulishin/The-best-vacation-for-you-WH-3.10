//
//  ResultsViewController.swift
//  The best vacation for you WH 3.10
//
//  Created by Kuzma on 16/01/2019.
//  Copyright © 2019 Kuzma Kulishin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answers: [Answer]? {
        didSet {
            print(#function, answers ?? "nil")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
