//
//  Question.swift
//  PersonalQuiz
//
//  Created by Инна Лаптева on 09.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.

struct Question {
    var text: String
    var type: ResponseType
    var answers : [Answer]
}

extension Question {
    
    //генерирует экзэмпляры структуры
    static func getQuestions() -> [Question] {
        //хардкодим: возвращаем массив вопросов.
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", animalType: .dog),
                        Answer(text: "Рыба", animalType: .cat),
                        Answer(text: "Морковь", animalType: .rabbit),
                        Answer(text: "Кукуруза", animalType: .turtle),
                ]
            ),
            Question(text: "Что вам нравится больше?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Плавать", animalType: .dog),
                        Answer(text: "Спать", animalType: .cat),
                        Answer(text: "Обниматься", animalType: .rabbit),
                        Answer(text: "Есть", animalType: .turtle),
                ]
            ),
            Question(text: "Любите ли вы поездки на машине?",
                     type: .range,
                     answers: [
                        Answer(text: "Ненавижу", animalType: .rabbit),
                        Answer(text: "Нервничаю", animalType: .dog),
                        Answer(text: "Люблю", animalType: .cat),
                        Answer(text: "Обожаю", animalType: .turtle)
                ]
            )
        ]
    }
    
}



