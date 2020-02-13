//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Инна Лаптева on 12.02.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressview: UIProgressView!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multitpleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var miltipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet var rangeLabel: [UILabel]!
    
    
    // MARK: - Pivate propeties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var choosenAnswers: [Answer] = []
    private var currentAnswers: [Answer] { questions[questionIndex].answers
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    
    // MARK: - IBActions
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let answerButtonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[answerButtonIndex]
        choosenAnswers.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multitipleButtonPressed() {
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                choosenAnswers.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangeButtonPressed() {
        
        let index = Int(round(rangeSlider.value * Float((currentAnswers.count - 1))))
        let currentAnswer =  currentAnswers[index]
        choosenAnswers.append(currentAnswer)
        
        nextQuestion()
    }
    
}

// MARK: - Private Mthods
extension QuestionsViewController {
    
    private func updateUI() {
        //скрываем все элементы
        for stackView in [singleStackView, multitpleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        // get current question
        // отображаем вопрос в соответствии с индексом вопросом
        let currentQuestion = questions[questionIndex]
        
        //set current question for questionLabel
        questionLabel.text = currentQuestion.text
        
        //calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        //set progress for progress view
        progressview.setProgress(totalProgress, animated: true)
        
        //Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion)
        
    }
    
    private func showCurrentAnswers(for question: Question) {
        switch question.type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multitpleStackView.isHidden = false
        for (label, answer) in zip(miltipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangeStackView(with answers: [Answer]) {
        rangeStackView.isHidden = false
        rangeLabel.first?.text = answers.first?.text
        rangeLabel.last?.text = answers.last?.text
    }
}

// MARK: - Navigation
extension QuestionsViewController {
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "resultSegue" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.totalAnswers = choosenAnswers
            
        }
   
    }
    
}
