//
//  ViewController.swift
//  Project2
//
//  Created by Lucas Maniero on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = 0
    var score = 0 {
        didSet {
            self.navigationItem.title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
        }
    }
    var answeredQuestions = 0
    
    let vStack: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.axis = .vertical
        sv.distribution = .equalCentering
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 16
        return sv
    }()
    
    let button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"estonia"), for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.tag = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.setImage(UIImage(named:"france"), for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"germany"), for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.tag = 2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .always
        setupConstraints()
        askQuestion()
    }
    
   
    
    private func setupConstraints() {
        view.addSubview(vStack)
        vStack.addSubviews(button1, button2, button3)
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 8),
            vStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            vStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
            vStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8)
        ])
    }
    
    private func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        navigationItem.title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        answeredQuestions += 1
        var alertController: UIAlertController
        let isCorrectAnswer = sender.tag == correctAnswer
        
        //Check if the user answered correctly to the question.
        // If it is correct: increase the score by 1 and displays a success message
        // If it is incorrect: decrease the score by 1 and displays a error message
        if isCorrectAnswer {
            score += 1
            alertController = UIAlertController(title: "Acertou!", message: "Você acertou. Essa é a bandeira correta. Score: \(score)", preferredStyle: .alert)
        } else {
            score -= 1
            let tappedFlagName = countries[sender.tag].uppercased()
            alertController = UIAlertController(title: "Errou!", message: "Essa é a bandeira do país \(tappedFlagName). Score: \(score)", preferredStyle: .alert)
        }
        
        // Checks if the game has finished and presents the final score, otherwise, presents a new question
        if answeredQuestions == 10 {
            alertController = UIAlertController(title: "Acabou o jogo", message: "Seu score final é: \(score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { action in
                self.score = 0
                self.answeredQuestions = 0
                self.askQuestion(action: action)
            }))
        } else {
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        }
        self.present(alertController, animated: true, completion: nil)
    }



}

extension UIStackView {
    func addSubviews(_ views:UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
