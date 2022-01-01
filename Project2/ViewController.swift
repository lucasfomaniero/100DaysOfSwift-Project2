//
//  ViewController.swift
//  Project2
//
//  Created by Lucas Maniero on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var flagsNames = [String]()
    
    let vStack: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 16
        return sv
    }()
    
    let button1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"estonia"), for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setImage(UIImage(named:"france"), for: .normal)
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"germany"), for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
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


}

extension UIStackView {
    func addSubviews(_ views:UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
