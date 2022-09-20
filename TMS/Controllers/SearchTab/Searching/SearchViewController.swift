

import UIKit
import GooglePlaces
import CoreLocation


final class SearchViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Variables and Functions/
    
    private func cityToViewDidTap() {
        
    }
    
    
    private func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
    }
    
    
    private func configureGesturesOnViewsUnderTextFields() {
        let tapGestureOnFromView = UITapGestureRecognizer(target: self, action: #selector(cityFromDidTap))
        cityFromView.addGestureRecognizer(tapGestureOnFromView)
        
        cityFromView.becomeFirstResponder()
        
    }
    
    @objc private func cityFromDidTap(_ gesture: UITapGestureRecognizer) {
//        self.navigationController?.pushViewController(fromViewController, animated: true)
    }

    
    @objc func searchButtonAction(_ sender: UIButton!) {
        
        
       
            let bc = BookingViewController()
            
            adultNumber = ticket.adult
            bikeNumber = ticket.bike
            childNumber = ticket.child
            
            ticketPrice = Double(10)//Double(((distanceLocation / 100) * Double(liter) * gasolinePrice))
        let kerosine: Int = 3
        var distance: Double = 1
        distance = startLocation.distance(from: endLocation) / 1000
        
        let trialPrice = (((Double(adultNumber) * 10) + (Double(bikeNumber) * 2) + (Double(childNumber) * 5)) * Double(kerosine) * Double(distance)) / 100
        print(ticket.travelFrom)
        print(ticket.travelTo)
        print(distance)
        
            passengerTicketPrice = trialPrice
            ticket.ticketPrice = String(format: "%.2f ", self.passengerTicketPrice)
            
        print(startLocation)
        print(endLocation)
            
            bc.finalTickerPrice = ticket.ticketPrice
//            bc.currencyTicket = currency
            bc.departLabel.text = ticket.travelFrom
            bc.arrivalLabel.text = ticket.travelTo
            bc.passengerLabel.text = numberOfPassengersTextField.text
            bc.fromDateLabel.text = SearchViewController.from + " \(ticket.departDate)"
            bc.returnDateLabel.text = SearchViewController.returnBack + " \(ticket.returnDate)"
            
        
        
            self.navigationController?.pushViewController(bc, animated: true)
            
        
        
//        let listOfFlightsViewController = FromViewController.init { [weak self] cityName in
//            self?.cityFromTextField.text = cityName
//        }
        print("тест: НАЙТИ БИЛЕТЫ")
//        self.navigationController?.pushViewController(listOfFlightsViewController, animated: true)


//        let distanceInMeters = coordinate0.distance(from: coordinate1)
//        print(distanceInMeters)
        
    }
    
    @objc func doneButtonTapped() {
        
        if dateToTextField.isFirstResponder {
            dateToTextField.text = dateFormatter.string(from: datePicker.date)
            ticket.departDate = dateFormatter.string(from: datePicker.date)
//            departLabel.isHidden = false
        }
        
        if dateReturnTextField.isFirstResponder {
            dateReturnTextField.text = dateFormatter.string(from: datePicker.date)
            ticket.returnDate = dateFormatter.string(from: datePicker.date)
//            returnLabel.isHidden = false
        }
        self.view.endEditing(true)
    }
    
    @objc func presentModal() {
        let detailViewController = DetailViewController()
        
        detailViewController.threeInt = { [weak self] adult, bike, child in
            
            self?.ticket.adult = adult
            self?.ticket.bike = bike
            self?.ticket.child = child
            self?.numberOfPassengersTextField.text = self?.stringToShow(adult: adult, bike: bike, child: child)
      
            
//            self?.textFieldsIsNotEmpty()
            
            
        }
        
        detailViewController.adultCounter = ticket.adult
        detailViewController.bikeCounter = ticket.bike
        detailViewController.childCounter = ticket.child
        
        detailViewController.transitioningDelegate  = detailViewController.overlayTransitioningDelegate
        detailViewController.modalPresentationStyle = .custom
        self.present(detailViewController, animated: true, completion: nil)
        
  
    }
    
    func stringToShow(adult: Int, bike: Int, child: Int) -> String {
        
        var finalString = ""
        
        if adult != 0 {
            finalString = SearchViewController.adult + " \(adult)    "
        }
        
        if bike != 0 {
            finalString += SearchViewController.bike + " \(bike)    "
        }
        
        if child != 0 {
            finalString += SearchViewController.child + " \(child)    "
        }
        
        return finalString
    }
    
    func showTabBar() {
        var frame = self.tabBarController?.tabBar.frame
        frame!.origin.y = self.view.frame.size.height - (frame?.size.height)!
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.frame = frame!
            
        })
    }
    
    let appearance = UINavigationBarAppearance()
    
    static var adult: String{"Взрослые"}
    static var bike: String{"Багаж"}
    static var child: String{"Дети"}
    static var from: String{"    Туда    "}
    static var returnBack: String{"Обратно"}
    
    
    var startLocation = CLLocation(latitude: 0.0, longitude: 0.0)
    var endLocation = CLLocation(latitude: 0.0, longitude: 0.0)
    var distanceLocation = CLLocationDistance()
    
    var liter = 30
    var gasolinePrice: Double = 0.0
    var ticketPrice: Double = 0.0
    var passengerTicketPrice: Double = 0.0
    
    var adultNumber = 0
    var bikeNumber = 0
    var childNumber = 0
    
    var ticket = TicketModel(travelFrom: "", travelTo: "", departDate: "", returnDate: "", passenger: "", adult: 0, bike: 0, child: 0, ticketPrice: "")
    
    //MARK: - Subviews
    
    var scrollView = UIScrollView()
    var contentView: UIView = .init()
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    let cityFromView = UIView()
    let cityToView = UIView()
    let dateToView = UIView()
    let dateReturnView = UIView()
    let numberOfPassengersView = UIView()
    let searchButton = UIButton()
    let infoTextView = UITextView()
    
    let cityFromTextField = TitledTextFieldView(title: "Откуда")
    let cityToTextField = TitledTextFieldView(title: "Куда")
    let dateToTextField = UITextField()
    let dateReturnTextField = UITextField()
    let numberOfPassengersTextField = UITextField()
    
    ///
    var isFrom: Bool = true
    ///
    
    
    //MARK: - Life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        showTabBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    //MARK: - Setup
    func setup() {
        buildHierarchy()
        configureSubviews()
        setupLayouts()
        
        
        
        configureGesturesOnViewsUnderTextFields()
        
    }
    
    
    func buildHierarchy() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(cityFromView)
        contentView.addSubview(cityToView)
        contentView.addSubview(dateToView)
        contentView.addSubview(dateReturnView)
        contentView.addSubview(numberOfPassengersView)
        contentView.addSubview(searchButton)
        contentView.addSubview(infoTextView)
        
        

        cityFromView.addSubview(cityFromTextField)
        cityToView.addSubview(cityToTextField)
        dateToView.addSubview(dateToTextField)
        dateReturnView.addSubview(dateReturnTextField)
        numberOfPassengersView.addSubview(numberOfPassengersTextField)
        
        
        
    }
    
    
    
    func configureSubviews() {
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.calendar = .current
        datePicker.minimumDate = Date()
        
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        
        
        
        dateToTextField.delegate = self
        dateReturnTextField.delegate = self
        numberOfPassengersTextField.delegate = self
        
        numberOfPassengersTextField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentModal)))
        
        configureSearchButton()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Найти билеты"
        view.backgroundColor = .systemGray6
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        
        
        
    }
    
    
    func setupLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide

        
        setupScrollView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        setupCityFromView()
        setupCityToView()
        setupDateToView()
        setupDateReturnView()
        setupNumberOfPassengersView()
        setupSearchButton()
        setupInfoTextView()
        datePickerConfig()
        
        func setupScrollView(){
            scrollView.translatesAutoresizingMaskIntoConstraints = false

            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
            
            scrollView.backgroundColor = .systemGray6
            scrollView.showsVerticalScrollIndicator = false
            scrollView.bounces = true
        }
        
        
        func setupCityFromView() {
            cityFromView.isUserInteractionEnabled = true
            cityFromView.layer.cornerRadius = 4
            cityFromView.layer.borderWidth = 0.8
            cityFromView.layer.borderColor = UIColor.systemGray.cgColor
            
            cityFromView.translatesAutoresizingMaskIntoConstraints = false
            cityFromView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
            cityFromView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            cityFromView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            cityFromView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
                        
//                        cityFromView.becomeFirstResponder()
            
            cityFromTextField.isUserInteractionEnabled = true
            cityFromTextField.translatesAutoresizingMaskIntoConstraints = false
            cityFromTextField.topAnchor.constraint(equalTo: cityFromView.topAnchor, constant: 4).isActive = true
            cityFromTextField.bottomAnchor.constraint(equalTo: cityFromView.bottomAnchor, constant: -4).isActive = true
            cityFromTextField.leadingAnchor.constraint(equalTo: cityFromView.leadingAnchor, constant: 4).isActive = true
            cityFromTextField.trailingAnchor.constraint(equalTo: cityFromView.trailingAnchor, constant: -4).isActive = true
            
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            cityFromTextField.startTyping = { [weak self] in
                self?.isFrom = true
                self?.cityFromTextField.resignFirstResponder()
                let autocompleteController = GMSAutocompleteViewController()
                autocompleteController.delegate = self
                
                
                autocompleteController.tableCellSeparatorColor = .clear
                
                self?.present(autocompleteController, animated: true, completion: nil)
                
                
            }

            
        }
        
        func setupCityToView() {
            cityToView.translatesAutoresizingMaskIntoConstraints = false
            cityToView.layer.cornerRadius = 4
            cityToView.layer.borderWidth = 0.8
            cityToView.layer.borderColor = UIColor.systemGray.cgColor
            
            cityToView.topAnchor.constraint(equalTo: cityFromView.bottomAnchor, constant: 12).isActive = true
            cityToView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            cityToView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            cityToView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            cityToTextField.translatesAutoresizingMaskIntoConstraints = false
            cityToTextField.topAnchor.constraint(equalTo: cityToView.topAnchor, constant: 4).isActive = true
            cityToTextField.bottomAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: -4).isActive = true
            cityToTextField.leadingAnchor.constraint(equalTo: cityToView.leadingAnchor, constant: 4).isActive = true
            cityToTextField.trailingAnchor.constraint(equalTo: cityToView.trailingAnchor, constant: -4).isActive = true
            
            cityToTextField.startTyping = { [weak self] in
                self?.isFrom = false
                self?.cityToTextField.resignFirstResponder()
                let autocompleteController = GMSAutocompleteViewController()
                autocompleteController.delegate = self
                
                autocompleteController.tableCellSeparatorColor = .clear
                
                self?.present(autocompleteController, animated: true, completion: nil)
            }
        }
        
        func setupDateToView() {
            dateToView.translatesAutoresizingMaskIntoConstraints = false
            
            dateToView.layer.cornerRadius = 4
            dateToView.layer.borderWidth = 0.8
            dateToView.layer.borderColor = UIColor.systemGray.cgColor
            
            
            dateToView.topAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: 12).isActive = true
            dateToView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            dateToView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -6).isActive = true
            dateToView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            dateToTextField.translatesAutoresizingMaskIntoConstraints = false
            dateToTextField.textAlignment = .left
            
            dateToTextField.attributedPlaceholder = NSAttributedString(
                string: "Дата туда",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 22)]
            )
            dateToTextField.font = .systemFont(ofSize: 22)
            dateToTextField.inputView = datePicker
            dateToTextField.topAnchor.constraint(equalTo: dateToView.topAnchor, constant: 4).isActive = true
            dateToTextField.bottomAnchor.constraint(equalTo: dateToView.bottomAnchor, constant: -4).isActive = true
            dateToTextField.leadingAnchor.constraint(equalTo: dateToView.leadingAnchor, constant: 8).isActive = true
            dateToTextField.trailingAnchor.constraint(equalTo: dateToView.trailingAnchor, constant: -4).isActive = true
        }
        
        func setupDateReturnView() {
            dateReturnView.translatesAutoresizingMaskIntoConstraints = false
            
            dateReturnView.layer.cornerRadius = 4
            dateReturnView.layer.borderWidth = 0.8
            dateReturnView.layer.borderColor = UIColor.systemGray.cgColor
            
            dateReturnView.topAnchor.constraint(equalTo: cityToView.bottomAnchor, constant: 12).isActive = true
            dateReturnView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 6).isActive = true
            dateReturnView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            dateReturnView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            dateReturnTextField.translatesAutoresizingMaskIntoConstraints = false
            dateReturnTextField.textAlignment = .left
            dateReturnTextField.attributedPlaceholder = NSAttributedString(
                string: "Дата обратно",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 22)]
            )
            dateReturnTextField.font = .systemFont(ofSize: 22)
            dateReturnTextField.topAnchor.constraint(equalTo: dateReturnView.topAnchor, constant: 4).isActive = true
            dateReturnTextField.bottomAnchor.constraint(equalTo: dateReturnView.bottomAnchor, constant: -4).isActive = true
            dateReturnTextField.leadingAnchor.constraint(equalTo: dateReturnView.leadingAnchor, constant: 8).isActive = true
            dateReturnTextField.trailingAnchor.constraint(equalTo: dateReturnView.trailingAnchor, constant: -4).isActive = true
        }
        
        func datePickerConfig() {

            let toolBar = UIToolbar()
            toolBar.barStyle = .black
            toolBar.sizeToFit()
            toolBar.tintColor = .systemBlue
            toolBar.isTranslucent = true
            toolBar.backgroundColor = .systemGray6
            let doneButton = UIBarButtonItem(title: "Выбрать", style: .done, target: self, action: #selector(doneButtonTapped))
            toolBar.setItems([doneButton], animated: true)
            
            dateToTextField.inputView = datePicker
            dateReturnTextField.inputView = datePicker
            dateToTextField.inputAccessoryView = toolBar
            dateReturnTextField.inputAccessoryView = toolBar

        }
        
        func setupNumberOfPassengersView() {
            numberOfPassengersView.translatesAutoresizingMaskIntoConstraints = false
            numberOfPassengersView.layer.cornerRadius = 4
            numberOfPassengersView.layer.borderWidth = 0.8
            numberOfPassengersView.layer.borderColor = UIColor.systemGray.cgColor
            
            numberOfPassengersView.topAnchor.constraint(equalTo: dateReturnView.bottomAnchor, constant: 12).isActive = true
            numberOfPassengersView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            numberOfPassengersView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            numberOfPassengersView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            
            numberOfPassengersTextField.translatesAutoresizingMaskIntoConstraints = false
            numberOfPassengersTextField.textAlignment = .left
            numberOfPassengersTextField.attributedPlaceholder = NSAttributedString(
                string: "Пассажиры и багаж",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 22)]
            )
            numberOfPassengersTextField.font = .systemFont(ofSize: 22)
            numberOfPassengersTextField.topAnchor.constraint(equalTo: numberOfPassengersView.topAnchor, constant: 4).isActive = true
            numberOfPassengersTextField.bottomAnchor.constraint(equalTo: numberOfPassengersView.bottomAnchor, constant: -4).isActive = true
            numberOfPassengersTextField.leadingAnchor.constraint(equalTo: numberOfPassengersView.leadingAnchor, constant: 8).isActive = true
            numberOfPassengersTextField.trailingAnchor.constraint(equalTo: numberOfPassengersView.trailingAnchor, constant: -4).isActive = true
            
        }
        
        
        
        
        func setupSearchButton() {
            searchButton.translatesAutoresizingMaskIntoConstraints = false
            searchButton.setTitle("НАЙТИ БИЛЕТЫ", for: .normal)
            searchButton.titleLabel!.font = UIFont(name: "Arial Bold", size: 18)
            searchButton.setTitleColor(UIColor.white, for: .normal)
            searchButton.backgroundColor = .systemBlue
            searchButton.layer.cornerRadius = 4
            
            searchButton.topAnchor.constraint(equalTo: numberOfPassengersView.bottomAnchor, constant: 12).isActive = true
            searchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            searchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
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
            infoTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            infoTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
            
            infoTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200).isActive = true
            infoTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            infoTextView.font = .systemFont(ofSize: 16)
            infoTextView.textColor = .systemGray
            infoTextView.text = "Внимание! Советуем ознакомиться с дейстующими правилами и ограничениями, касаемо стран вашего путешествия"
            
        }
        
    }
}

//MARK: - extension


    
extension SearchViewController: GMSAutocompleteViewControllerDelegate {
    public func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        let long = place.coordinate.longitude
        let lat = place.coordinate.latitude
        
        
        if let name = place.name {

            

            if isFrom {
                cityFromTextField.updateText(text: name)
                
                
                ticket.travelFrom = name
                startLocation = CLLocation(latitude: lat, longitude: long)
                
                
            } else {
                cityToTextField.updateText(text: name)
                
                
                ticket.travelTo = name
                endLocation = CLLocation(latitude: lat, longitude: long)
                
                
                
            }
        }
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    public func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error", error.localizedDescription)
    }
    
    public func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}


