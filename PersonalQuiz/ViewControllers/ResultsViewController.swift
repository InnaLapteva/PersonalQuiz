//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Инна Лаптева on 12.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: Properties
    var totalAnswers: [Answer] = []
    
    var responses: [Answer]!
    
    //MARK: IB Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
//        scoreCalculation(answers: totalAnswers)
        updateResult()
    }
}

//MARK: Functions

extension ResultsViewController {
    
//    private func scoreCalculation(answers: [Answer]) {
//
//        var scoreDog = 0
//        var scoreCat = 0
//        var scoreRabbit = 0
//        var scoreTurtle = 0
//
//        var scores:[AnimalType : Int] = [:]
//
//        for answer in answers {
//
//            switch answer.animalType {
//            case .cat:
//                scoreCat += 1
//                scores.updateValue(scoreCat, forKey: .cat)
//            case .dog:
//                scoreDog += 1
//                scores.updateValue(scoreDog, forKey: .dog)
//            case .rabbit:
//                scoreRabbit += 1
//                scores.updateValue(scoreRabbit, forKey: .rabbit)
//            case .turtle:
//                scoreTurtle += 1
//                scores.updateValue(scoreTurtle, forKey: .turtle)
//            }
//
//            let sortedScores = scores.sorted { $0.value > $1.value }
//            guard let highestScore = sortedScores.first?.key else { return }
//
//            updateResults(animal: highestScore)
//        }
//    }
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType : Int] = [:]
        let animals = responses.map {$0.animalType}
        
        for animal in animals {
            guard let animalTypeCount = frequencyOfAnimals[animal] else {
                frequencyOfAnimals[animal] = 1
                return
            }
            frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
        }
        
        let sortedFrequencyOfAnimal = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let highestScore = sortedFrequencyOfAnimal.first?.key else { return }
        
        updateResults(animal: highestScore)
    }
    
    private func updateResults(animal: AnimalType) {
        resultLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
}
