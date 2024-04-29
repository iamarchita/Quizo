//
//  SecondpageViewController.swift
//  QUIZO
//
//  Created by STUDENT on 4/22/24.
//

import UIKit

class SecondpageViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    
    var gameModels = [Question]()
    var currentQuestion : Question?
    @IBOutlet var label:UILabel!
    
    @IBOutlet weak var table: UITableView!
    var score = 0
    
    @IBOutlet weak var cell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        configureUI(question: gameModels.first!)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
    }
    
    private func configureUI(question : Question){
        label.text = question.text
        currentQuestion = question
        table.delegate = self
        table.dataSource = self
        
        
    }
    
    private func checkAnswer(_ answer: Answer, question: Question) -> Bool {
        return question.answers.contains { $0.text == answer.text && $0.correct }
    }

    
    
    
    private func setupQuestions(){
        gameModels.append(Question(text: "what is full form of RAM ?", answers: [
            Answer(text: "Read access memory", correct: false),
            Answer(text: "Random access memory", correct: true),
            Answer(text: "Random allocation memory", correct: false),
            Answer(text: "Rapid access memory", correct: false),
        ]))
        
        gameModels.append(Question(text: "what does HTML stand for ?", answers: [
            Answer(text: "Hyper text markup language", correct: true),
            Answer(text: "Hyperlink and  text markup language", correct: false),
            Answer(text: "Hyper transfer markup language", correct: false),
            Answer(text: "Hyper tool markup language", correct: false),
        ]))
        
        gameModels.append(Question(text: "Which programming language is commonly used for creating mobilr language ?", answers: [
            Answer(text: "Java", correct: false),
            Answer(text: "Python", correct: false),
            Answer(text: "Swift", correct: true),
            Answer(text: "C++", correct: false),
        ]))
        
        gameModels.append(Question(text: "what is purpose of CSS in web development ?", answers: [
            Answer(text: "To create dynamic web content", correct: false),
            Answer(text: "To define the structure of a web page", correct: false),
            Answer(text: "To enhance the functionality of a web page", correct: false),
            Answer(text: "To style the appearance of a web page", correct: true),
        ]))
        
        gameModels.append(Question(text: "Which of the following is not a type of cloud computing service ?", answers: [
            Answer(text: "Infrastructure as a service(IaaS)", correct: false),
            Answer(text: "Platform as a service(PaaS)", correct: false),
            Answer(text: "Software as a service(SaaS)", correct: false),
            Answer(text: "Hardware as a service(HaaS)", correct: true),
        ]))
        
        gameModels.append(Question(text: "what does VPN stand for ?", answers: [
            Answer(text: "Virtual private network", correct: true),
            Answer(text: "Very personal network", correct: false),
            Answer(text: "Virtual personal network", correct: false),
            Answer(text: "Visual private network", correct: false),
        ]))
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentQuestion?.answers.count ?? 0
    }
    
  
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath) as! ListTableViewCell
        cell.label?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
        
        guard let question = currentQuestion else{
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer , question:question){
            score += 1
            if let index = gameModels.firstIndex(where: {$0.text == currentQuestion?.text}){
                if index < (gameModels.count - 1){
                    let nextQuestion = gameModels[index+1]
                   print("\(nextQuestion.text)")
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                   table.reloadData()
                }
                else{
                    let alert = UIAlertController(title: "Done", message: "You beat the game Your score is \(score)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { action in
                        self.score = 0
                        self.configureUI(question: self.gameModels.first!)
                        
                        
                    }))
                    
                    
                    
                    present (alert,animated: true)
                    
                }
                }
            }
            else{
                let alert = UIAlertController(title: "Wrong", message: "Try better", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: nil))
                present (alert,animated: true)
            }
        }
        
    }
    struct Question{
        let text : String
        let answers : [Answer]
    }
    struct Answer{
        let text: String
        let correct : Bool
    }
    

