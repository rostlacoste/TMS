import UIKit

class NumberOfPassengersViewController: UIViewController {
    
    
    
    func animateDismissView() {
        // hide main container view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
    
    
    
    // 1
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Пассажиры"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    
    lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.titleLabel!.font = UIFont(name: "Arial Bold", size: 24)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 20
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(buttonPlusAction), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.titleLabel!.font = UIFont(name: "Arial Bold", size: 24)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 20
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(buttonMinusAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPlusAction(_ sender: UIButton!) {
        print("test + ")
        
    }
    
    @objc func buttonMinusAction(_ sender: UIButton!) {
        print("test -")
        
        
    }
    
    
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, buttonPlus, buttonMinus])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        return stackView
    }()
    
    
    
    // 2
    let maxDimmedAlpha: CGFloat = 0
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        
        return view
    }()
    
    let defaultHeight: CGFloat = 200
    
    // 3. Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        
        
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonPlus.layoutIfNeeded()
        self.buttonMinus.layoutIfNeeded()
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        // ..
        NSLayoutConstraint.activate([
            // ..
            // content stackView
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -32),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        ])
    }
}

