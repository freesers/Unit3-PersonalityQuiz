//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Sander de Vries on 14/11/2018.
//  Copyright © 2018 Sander de Vries. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    /// Calculate personality from quiz
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [Answer.AnimalType: Int] = [:]
        
        let responseTypes = responses.map { $0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0 + 1)
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
