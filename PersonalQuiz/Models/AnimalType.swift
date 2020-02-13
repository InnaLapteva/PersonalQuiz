//
//  AnimalType.swift
//  PersonalQuiz
//
//  Created by Инна Лаптева on 09.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case rabbit = "🐰"
    case cat = "🐱"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
           return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы сами себе на уме. Любите гулять сами по себе и цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии"
        case .turtle:
            return "Ваша сила в мудрости. Вы медленно и вдумчиво выигрываете на больших расстояних"
        }
    } 
}
