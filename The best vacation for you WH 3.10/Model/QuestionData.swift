//
//  QuestionData.swift
//  The best vacation for you WH 3.10
//
//  Created by Kuzma on 18/01/2019.
//  Copyright © 2019 Kuzma Kulishin. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]

}


// типы ответов

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: VacationType
}




//var string = "Google"
//var attributedString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: URL(string: "http://www.google.com")!])
// yourTextView.attributedText = attributedString

enum VacationType: Character {
    case home = "🎮", bar = "🍻", bitch = "☀️", sport = "🚴‍♀️"
    
    var definition: String {
        switch self {
        case .home:
            return "Телепортироваться в параллельную реальность отлично отвлечет вас от проблем!"
        case .bar:
            return "Стаканчик холодного в компании друзей, это то, что сейчас вам нужно!"
        case .bitch:
            return "Отдых на белом песке под палящим солнцем зарядит вас на год вперед!"
        case .sport:
            return "Только максимальная активность полностью снимет стресс!"
        }
    }
    
    
    var linkVacation: String {
        switch self {
        case .home:
            return "Купить PS 4: https://www.mvideo.ru/playstation/ps4-konsoli-4333"
        case .bar:
            return "Сходить в бар: https://pigandrose.me/rus/"
        case .bitch:
            return "Поехать на море: https://tours.tutu.ru/indonesia/bali/iz/491_moskva/"
        case .sport:
            return "Выбрать активность: http://semenovclub.ru"
        }
    }
}
