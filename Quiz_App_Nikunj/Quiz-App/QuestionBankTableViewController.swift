//
//  QuestionBankTableViewController.swift
//  Quiz-App
//
//  Created by Nikunj Patel on 2024-12-13.
//

import UIKit

class QuestionBankTableViewController: UITableViewController, QuestionBuilderDelegate, UpdateQuestionDelegate {
    func doneClicked(newQuestion: QuestionModel) {
        QuestionManager.shared.addNewQuestion(q: newQuestion)
        print("new question added")
        DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    }
    
    func updateQuestion(index: Int, newQuestion: QuestionModel) {
        print(index)
        QuestionManager.shared.questions[index] = newQuestion
        DispatchQueue.main.async {
               self.tableView.reloadData()
           }    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return QuestionManager.shared.questions.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionCellUpdateTableViewCell
        
        let question = QuestionManager.shared.questions[indexPath.row]
        cell.questionText.text = question.question
        cell.correctAnswerText.text = question.correctAnswer
        cell.incorrectAnswer1Text.text = question.incorrectAnswer2
        cell.incorrectAnswer3Text.text = question.incorrectAnswer3
        return cell
    }
    
    func saveQuestion(newQuestion: QuestionModel){
        QuestionManager.shared.addNewQuestion(q: newQuestion)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuestion"{
            if segue.identifier == "addQuestion" {
                   let addQuestionVC = segue.destination as! QuestionBuilderViewController
                   addQuestionVC.delegate = self
               }
        }
        else if segue.identifier == "updateQuestion"{
            let uvc = segue.destination as! QuestionCellUpdateViewController
            uvc.selectedIndex = tableView.indexPathForSelectedRow!.row
            uvc.delegate = self
        }
        func cancel() {
            
        }
    }
}
