

import UIKit

let searchViewController: SearchViewController = SearchViewController()

class SearchViewController: UIViewController {
    
    //MARK: - Variables /
    
    
    
    let cityFromView = UIView()
    let cityToView = UIView()
    let dateToView = UIView()
    let dateReturnView = UIView()
    let numberOfPassengersView = UIView()
    let searchButton = UIButton()
    let infoTextView = UITextView()
    
    let cityFromTextField = TitledTextFieldView(title: "Откуда")
    let cityToTextField = TitledTextFieldView(title: "Куда")
    let dateToTextField = TitledTextFieldView(title: "Дата туда")
    let dateReturnTextField = TitledTextFieldView(title: "Дата обратно")
    let numberOfPassengersTextField = TitledTextFieldView(title: "Пассажиры")
    
    
    
    func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
    }
    
    private func configureGesturesOnTextField() {
        let tapGestureOnTextField = UITapGestureRecognizer(target: self, action: #selector(textFieldDidTap))
        cityToView.addGestureRecognizer(tapGestureOnTextField)
        cityFromView.addGestureRecognizer(tapGestureOnTextField)
    }
    @objc private func textFieldDidTap(_ gesture: UITapGestureRecognizer ) {
        self.navigationController?.pushViewController(fromViewController, animated: true)
    }
    
    
    
    @objc func searchButtonAction(_ sender: UIButton!) {
        print("тест: НАЙТИ БИЛЕТЫ")
//        self.navigationController?.pushViewController(fromViewController, animated: true)
    }
    
    
    
    
    
    
    
    let appearance = UINavigationBarAppearance()
    
    
    //MARK: - Subviews
    
    
    
    
    
    //MARK: - Life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        func showTabBar() {
            var frame = self.tabBarController?.tabBar.frame
            frame!.origin.y = self.view.frame.size.height - (frame?.size.height)!
            UIView.animate(withDuration: 0.5, animations: {
                self.tabBarController?.tabBar.frame = frame!
            })
        }
        
        showTabBar()
        
    }
    
    //MARK: - Setup
    func setup() {
        buildHierarchy()
        configureSubviews()
        setupLayouts()
    }
    
    
    func buildHierarchy() {
        
        view.addSubview(cityFromView)
        view.addSubview(cityToView)
        view.addSubview(dateToView)
        view.addSubview(dateReturnView)
        view.addSubview(numberOfPassengersView)
        view.addSubview(searchButton)
        view.addSubview(infoTextView)
        
        
        
        cityFromView.addSubview(cityFromTextField)
        cityToView.addSubview(cityToTextField)
        dateToView.addSubview(dateToTextField)
        dateReturnView.addSubview(dateReturnTextField)
        numberOfPassengersView.addSubview(numberOfPassengersTextField)
        
//        self.view.bringSubviewToFront(cityFromView)
        
        
        
    }
    
    
    
    func configureSubviews() {
        
        
        
        configureSearchButton()
        configureGesturesOnTextField()
        
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Найти билеты"
        view.backgroundColor = .systemGray6
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
       
        
    }
    
    
    func setupLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide
        setupCityFromView()
        setupCityToView()
        setupDateToView()
        setupDateReturnView()
        setupNumberOfPassengersView()
        setupSearchButton()
        setupInfoTextView()
        
        
        
        func setupCityFromView() {
            cityFromView.isUserInteractionEnabled = true
            cityFromView.translatesAutoresizingMaskIntoConstraints = false
            cityFromView.layer.cornerRadius = 4
            cityFromView.layer.borderWidth = 0.8
            cityFromView.layer.borderColor = UIColor.systemGray.cgColor
            
            cityFromView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16).isActive = true
            cityFromView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            cityFromView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            cityFromView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            
            cityFromTextField.translatesAutoresizingMaskIntoConstraints = false
            cityFromTextField.topAnchor.constraint(equalTo: cityFromView.topAnchor, constant: 4).isActive = true
            cityFromTextField.bottomAnchor.constraint(equalTo: cityFromView.bottomAnchor, constant: -4).isActive = true
            cityFromTextField.leadingAnchor.constraint(equalTo: cityFromView.leadingAnchor, constant: 4).isActive = true
            cityFromTextField.trailingAnchor.constraint(equalTo: cityFromView.trailingAnchor, constant: -4).isActive = true
            
           
            
            
          
            
            
        }
        
        func setupCityToView() {
            cityToView.translatesAutoresizingMaskIntoConstraints = false
//            cityToView.backgroundColor = .systemGray4
            cityToView.layer.cornerRadius = 4
            cityToView.layer.borderWidth = 0.8
            cityToView.layer.borderColor = UIColor.systemGray.cgColor
            
            cityToView.topAnchor.constraint(equalTo: cityFromView.bottomAnchor, constant: 12).isActive = true
            cityToView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            cityToView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            cityToView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            cityToTextField.translatesAutoresizingMaskIntoConstraints = false
            cityToTextField.topAnchor.constraint(equalTo: cityToView.topAnchor, constant: 4).isActive = true
            cityToTextField.bottomAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: -4).isActive = true
            cityToTextField.leadingAnchor.constraint(equalTo: cityToView.leadingAnchor, constant: 4).isActive = true
            cityToTextField.trailingAnchor.constraint(equalTo: cityToView.trailingAnchor, constant: -4).isActive = true
        }
        
        func setupDateToView() {
            dateToView.translatesAutoresizingMaskIntoConstraints = false
//            dateToView.backgroundColor = .systemGray4
            dateToView.layer.cornerRadius = 4
            dateToView.layer.borderWidth = 0.8
            dateToView.layer.borderColor = UIColor.systemGray.cgColor
            
            
            dateToView.topAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: 12).isActive = true
            dateToView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            dateToView.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -6).isActive = true
            dateToView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            dateToTextField.translatesAutoresizingMaskIntoConstraints = false
            dateToTextField.topAnchor.constraint(equalTo: dateToView.topAnchor, constant: 4).isActive = true
            dateToTextField.bottomAnchor.constraint(equalTo: dateToView.bottomAnchor, constant: -4).isActive = true
            dateToTextField.leadingAnchor.constraint(equalTo: dateToView.leadingAnchor, constant: 4).isActive = true
            dateToTextField.trailingAnchor.constraint(equalTo: dateToView.trailingAnchor, constant: -4).isActive = true
        }
        
        func setupDateReturnView() {
            dateReturnView.translatesAutoresizingMaskIntoConstraints = false
//            dateReturnView.backgroundColor = .systemGray4
            dateReturnView.layer.cornerRadius = 4
            dateReturnView.layer.borderWidth = 0.8
            dateReturnView.layer.borderColor = UIColor.systemGray.cgColor
            
            dateReturnView.topAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: 12).isActive = true
            dateReturnView.leadingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 6).isActive = true
            dateReturnView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            dateReturnView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            dateReturnTextField.translatesAutoresizingMaskIntoConstraints = false
            dateReturnTextField.topAnchor.constraint(equalTo: dateReturnView.topAnchor, constant: 4).isActive = true
            dateReturnTextField.bottomAnchor.constraint(equalTo: dateReturnView.bottomAnchor, constant: -4).isActive = true
            dateReturnTextField.leadingAnchor.constraint(equalTo: dateReturnView.leadingAnchor, constant: 4).isActive = true
            dateReturnTextField.trailingAnchor.constraint(equalTo: dateReturnView.trailingAnchor, constant: -4).isActive = true
        }
        
        func setupNumberOfPassengersView() {
            numberOfPassengersView.translatesAutoresizingMaskIntoConstraints = false
//            numberOfPassengersView.backgroundColor = .systemGray4
            numberOfPassengersView.layer.cornerRadius = 4
            numberOfPassengersView.layer.borderWidth = 0.8
            numberOfPassengersView.layer.borderColor = UIColor.systemGray.cgColor
            
            numberOfPassengersView.topAnchor.constraint(equalTo: dateReturnView.bottomAnchor, constant: 12).isActive = true
            numberOfPassengersView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            numberOfPassengersView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            numberOfPassengersView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            numberOfPassengersTextField.translatesAutoresizingMaskIntoConstraints = false
            numberOfPassengersTextField.topAnchor.constraint(equalTo: numberOfPassengersView.topAnchor, constant: 4).isActive = true
            numberOfPassengersTextField.bottomAnchor.constraint(equalTo: numberOfPassengersView.bottomAnchor, constant: -4).isActive = true
            numberOfPassengersTextField.leadingAnchor.constraint(equalTo: numberOfPassengersView.leadingAnchor, constant: 4).isActive = true
            numberOfPassengersTextField.trailingAnchor.constraint(equalTo: numberOfPassengersView.trailingAnchor, constant: -4).isActive = true
            
        }
        
        func setupSearchButton() {
            searchButton.translatesAutoresizingMaskIntoConstraints = false
            searchButton.setTitle("НАЙТИ БИЛЕТЫ", for: .normal)
            searchButton.titleLabel!.font = UIFont(name: "Arial Bold", size: 18)
            searchButton.setTitleColor(UIColor.white, for: .normal)
            searchButton.backgroundColor = .systemGreen
            searchButton.layer.cornerRadius = 4
            
            searchButton.topAnchor.constraint(equalTo: numberOfPassengersView.bottomAnchor, constant: 12).isActive = true
            searchButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            searchButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            searchButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        }
        
        func setupInfoTextView() {
            infoTextView.translatesAutoresizingMaskIntoConstraints = false
            infoTextView.backgroundColor = .white
            infoTextView.layer.cornerRadius = 4
            infoTextView.isEditable = false
            
            infoTextView.layer.masksToBounds = false
            infoTextView.layer.shadowColor = UIColor.black.cgColor
            infoTextView.layer.shadowOpacity = 0.5
            infoTextView.layer.shadowOffset = .zero
            infoTextView.layer.shadowRadius = 4
            infoTextView.layer.shadowPath = UIBezierPath(rect: infoTextView.bounds).cgPath
            infoTextView.layer.shouldRasterize = true
            infoTextView.layer.rasterizationScale = UIScreen.main.scale
            
            infoTextView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 12).isActive = true
            infoTextView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
            infoTextView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
            infoTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            infoTextView.font = .systemFont(ofSize: 16)
            infoTextView.textColor = .systemGray
            infoTextView.text = "Безопасные поездки! Стремясь предложить вам наилучшие впечатления от путешествий, мы придаем огромное значение безопасности и надежности. Узнайте больше о наших санитарно-гигиенических мерах и правилах поездок"
            
        }
        
    }
}

//MARK: - extension






