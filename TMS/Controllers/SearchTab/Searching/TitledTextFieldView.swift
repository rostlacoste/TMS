

import Foundation
import UIKit



class TitledTextFieldView: UIView {
    
    var startTyping: (() -> Void)?
    var text: String? {
        get {
            textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    var textField: UITextField = .init()
    var titleLabel: UILabel = .init()
    var bottomLine: UIView!
    var isEditable: Bool = true {
        didSet {
            self.textField.isEnabled = isEditable
            bottomLine.isHidden = !isEditable
        }
    }
    
    lazy var inactiveConstraints: [NSLayoutConstraint] = [
        titleLabel.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: -16),
    ]
    
    lazy var activeConstraints: [NSLayoutConstraint] = [
        titleLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 16)
    ]
    
    func didBecomeActive(animated: Bool = true) {
        let action = {
            self.titleLabel.textColor = .systemGray
            self.titleLabel.font = .systemFont(ofSize: 12)
            self.deactivateInactiveConstraint()
            self.activateActiveCostraints()
            self.layoutIfNeeded()
            self.setNeedsDisplay()
        }
        if animated {
            UIView.animate(withDuration: 0.2) {
                action()
            }
        } else {
            action()
        }
    }
    
    func deactivateActiveConstaint() {
        self.activeConstraints.forEach({ $0.isActive = false })
    }
    
    func activateActiveCostraints() {
        self.activeConstraints.forEach({ $0.isActive = true })
    }
    
    func deactivateInactiveConstraint() {
        self.inactiveConstraints.forEach({ $0.isActive = false })
    }
    
    func activateInactiveConstraints() {
        self.inactiveConstraints.forEach({ $0.isActive = true })
    }
    
    public func updateText(text: String) {
        self.textField.text = text
        self.titleLabel.font = .systemFont(ofSize: 22)
        
        self.deactivateInactiveConstraint()
        self.activateActiveCostraints()
        didBecomeInactive()
    }
    
    func didBecomeInactive(animated: Bool = true) {
        let action = {
            self.titleLabel.textColor = .systemGray
            if (self.textField.text ?? "").isEmpty {
                self.titleLabel.font = .systemFont(ofSize: 22)
                self.textField.font = .systemFont(ofSize: 22)
                self.deactivateActiveConstaint()
                self.activateInactiveConstraints()
                self.layoutIfNeeded()
                self.setNeedsDisplay()
            } else {
                self.titleLabel.font = .systemFont(ofSize: 12)
            }
        }
        if animated {
            UIView.animate(withDuration: 0.2) {
                action()
            }
        } else {
            action()
        }
    }
    
    func setup() {
        self.addSubview(textField)
        self.addSubview(titleLabel)
        
        textField.delegate = self
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 8
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
//        bottomLine = textField.addBorders(sides: [.bottom], color: .blue)[0]
        textField.sizeToFit()
        didBecomeInactive(animated: false)
        
    }
    
    func updateTextFieldName(text: String) {
        titleLabel.text = text
    }
    
    init(title: String, initialValue: String? = "", frame: CGRect = .init(), startTyping: (() -> Void)? = nil) {
        super.init(frame: frame)
        self.startTyping = startTyping
        text = initialValue
        titleLabel.text = title
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitledTextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        startTyping?()
        self.didBecomeActive()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.didBecomeInactive()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

