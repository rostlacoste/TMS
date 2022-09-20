
//
//  CustomPassangersView.swift
//  BusApp
//
//  Created by REEMOTTO on 23.08.22.
//

import UIKit

class CustomPassangersView: UIView {
    
    //MARK: - State
    
    var title: String
    var infoIcon: Bool
    
    var counter = 0
    public var completionHadler: ((Int) -> Void)?
    
    //MARK: - Subviews
    
    let passangerLabel = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    var numberLabel = UILabel()
    var bottomLine = UIView()
    
    
    // MARK: - Initializers
    
    init(title: String, infoIcon: Bool, count: Int, completionHadler: ((Int?) -> Void)? = nil, frame: CGRect = .init()) {
        
        self.title = title
        self.infoIcon = infoIcon
        self.counter = count
        self.completionHadler = completionHadler
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setup() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.backgroundColor = .white
        
        self.addSubview(passangerLabel)
        self.addSubview(minusButton)
        self.addSubview(plusButton)
        self.addSubview(numberLabel)
        self.addSubview(bottomLine)
        
        passangerLabel.text = title
        passangerLabel.textColor = .black
        passangerLabel.textAlignment = .left
        passangerLabel.font = .boldSystemFont(ofSize: 18)
        passangerLabel.numberOfLines = 0
        
        minusButton.setImage(UIImage(named: "minus"), for: .normal)
        minusButton.backgroundColor = .white
        minusButton.tintColor = .systemBlue
        minusButton.contentMode = .scaleAspectFill
        minusButton.clipsToBounds = true
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.tintColor = .systemBlue
        plusButton.backgroundColor = .white
        plusButton.contentMode = .scaleAspectFill
        plusButton.clipsToBounds = true
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        numberLabel.text = String(counter)
        numberLabel.textColor = .black
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: 18)
        
        bottomLine.backgroundColor = .systemGray4
        
        passangerLabel.translatesAutoresizingMaskIntoConstraints = false
        passangerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        passangerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        passangerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passangerLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor, constant: -10).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: - Handlers
    
    @objc func plusButtonTapped() {
        
        counter += 1
        numberLabel.text = String(counter)
        completionHadler?(counter)
        
    }
    
    @objc func minusButtonTapped() {
        
        if counter <= 0 {
            counter = 0
        } else {
            counter -= 1
        }
        numberLabel.text = String(counter)
        completionHadler?(counter)
    }
    
}


