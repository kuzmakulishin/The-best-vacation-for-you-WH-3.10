//
//  QuestionViewController.swift
//  The best vacation for you WH 3.10
//
//  Created by Kuzma on 16/01/2019.
//  Copyright © 2019 Kuzma Kulishin. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    
    // вопрос, который выбран у нас
    var questionIndex = 0
    
    var questions: [Question] = [
        
        Question(
            text: "Какой отдых вы предпочитаете?",
            type: .single,
            answers: [
                Answer(text: "Домашний", type: .home),
                Answer(text: "Тусовка", type: .bar),
                Answer(text: "Солнечный", type: .bitch),
                Answer(text: "Активный", type: .sport),]
        ),
    
        Question(
            text: "Как вам нравится отдыхать?",
            type: .multiple,
            answers: [
                Answer(text: "Побыть одному", type: .home),
                Answer(text: "В компании друзей", type: .bar),
                Answer(text: "Максимальный релакс", type: .bitch),
                Answer(text: "Активный отдых", type: .sport),]
        ),
        
        Question(
            text: "На сколько вам нравится активный отдых?",
            type: .ranged,
            answers: [
                Answer(text: "Не нравится", type: .home),
                Answer(text: "Скорее нет", type: .bar),
                Answer(text: "Скорее да", type: .bitch),
                Answer(text: "Очень нравится", type: .sport),]
        )
        
        
    ]

    
    var answersChosen = [Answer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        
        let question = questions[questionIndex]
        let answers = question.answers
        let progress = Float(questionIndex) / Float(questions.count)
        /* сначала будет равен нулю, потом 1/3, потом 2/3 и мы приводим к типу Float чтобы 0 постоянно не был*/
        
        // присваиваем вопросу лейблы, шапке номер вопроса, нижний прогресс двигается
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = question.text
        progressView.setProgress(progress, animated: true)
        
        switch question.type {
        case .single:
            updateSingleStack(with: answers)
        case .multiple:
            updateMultipleStack(with: answers)
        case .ranged:
            updateRangedStack(with: answers)
        }
    }
    
    func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        
/* мы проходимся в цикле от 0 до количество наших Баттонов (меньше на единицу) и присваиваем очередному баттону вызываем его метод setTitle, берем очередной ответ из массива берем его текст и используем */
        
//            for i in 0..<singleButtons.count {
//                singleButtons[i].setTitle(answers[i].text, for: .normal)
//            }
// но ниже альтарнативный вариант
/* берем наш массив сингл баттон, делаем из него массив кортежей где есть индекс (offset) и  element и для каждого (forEach) из эти элементов мы запускаем замыкание. $0 - это текущий элемент, element - это по сути баттон,
         далее устанавливаем тайтл */
        
        guard singleButtons.count <= answers.count else { return } // чтобы небыло вылета, ставим ограничение
        singleButtons.enumerated().forEach {
            $0.element.setTitle(answers[$0.offset].text, for: .normal)
        }
    }
    
    func updateMultipleStack(with answers: [Answer]) {
        
        multipleStackView.isHidden = false
        guard multiLabels.count <= answers.count else { return }
        multiLabels.enumerated().forEach {
            $0.element.text = answers[$0.offset].text
        }
    }
    
    func updateRangedStack(with answers: [Answer]) {
        
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.answers = answersChosen
        }
    }
    
    
    /*
     1) нужно раскомментировать препере и проверить что сегвей.индификатор = резалт сегвею
     2) взять segue.destination проверить, что он конвертируется в резал вью контроллер
     3) взять, что у нас сконвертировалось, взять свойсво ансверс и присвоить ему ансвер answersChosen
     4) после этого можно работать на третьем экране
     
     */
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        guard let index = singleButtons.index(of: sender) else { return }
        
        let answer = answers[index]
        
        answersChosen.append(answer)
        print(#function, answer)
        print()
        
        nextQuestion()
        
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        // сначала получаем массив ответов
        let answers = questions[questionIndex].answers
        
        // нужно проверить какие свитчи включены, те ответы и добавляем
        // проходим по массиву свитчей
        multiSwitches.enumerated().forEach {
            if $0.element.isOn {
                let answer = answers[$0.offset]
                answersChosen.append(answer)
                print(#function, answer)
            }
        }
        
        print()
        
        nextQuestion()
        
    }
    
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        
        let answers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(answers.count - 1)))
        
        let answer = answers[index]
        answersChosen.append(answer)
        
        print(answer)
        print()
        
        nextQuestion()
        
    }
    
    
    
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    

}
