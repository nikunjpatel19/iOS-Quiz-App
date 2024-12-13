//
//  QuestionCellUpdateViewController.swift
//  Quiz-App
//
//  Created by Nikunj Patel on 2024-12-13.
//

import UIKit
protocol UpdateQuestionDelegate{
    func updateQuestion(index: Int,newQuestion: QuestionModel)
}
class QuestionCellUpdateViewController: UIViewController {
    var delegate: UpdateQuestionDelegate?
        var selectedIndex : Int = 0
    
    
    @IBOutlet weak var questionText: UITextField!
    
    @IBOutlet weak var correctAnswerText: UITextField!
    
    @IBOutlet weak var incorrectAnswer1Text: UITextField!
    
    @IBOutlet weak var incorrectAnswer2Text: UITextField!
    
    @IBOutlet weak var incorrectAnswer3Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = QuestionManager.shared.questions[selectedIndex].question;
                correctAnswerText.text = QuestionManager.shared.questions[selectedIndex].correctAnswer;
        incorrectAnswer1Text.text = QuestionManager.shared.questions[selectedIndex].incorrectAnswer1;
        incorrectAnswer2Text.text = QuestionManager.shared.questions[selectedIndex].incorrectAnswer2;
        incorrectAnswer3Text.text = QuestionManager.shared.questions[selectedIndex].incorrectAnswer3;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateQuestionClicked(_ sender: Any) {
        if let questionText = questionText.text , let correctAnswer = correctAnswerText.text,
           let incorrectAnswer1 = incorrectAnswer1Text.text,
           let incorrectAnswer2 = incorrectAnswer2Text.text,
           let incorrectAnswer3 = incorrectAnswer3Text.text
            
        {
            if !questionText.isEmpty , !correctAnswer.isEmpty, !incorrectAnswer1.isEmpty,
               !incorrectAnswer2.isEmpty, !incorrectAnswer3.isEmpty
            {
                let newQuestion = QuestionModel(question: questionText, correctAnswer: correctAnswer, incorrectAnswer1: incorrectAnswer1, incorrectAnswer2: incorrectAnswer2, incorrectAnswer3: incorrectAnswer3, answer: Answer(isCorrect: true, text: correctAnswer) )
                
                delegate?.updateQuestion(index: selectedIndex, newQuestion: newQuestion)
                dismiss(animated: true)
            }
            
        }
    }
}
