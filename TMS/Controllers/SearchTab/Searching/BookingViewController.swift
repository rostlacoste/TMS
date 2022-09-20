
import UIKit
import WebKit

class BookingViewController: UIViewController {
    
    // MARK: - Properties

    var finalTickerPrice: String = ""

    
    private func configurebuyButtonPressed() {
        buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
    }
    
    
    
    @objc func buyButtonAction(_ sender: UIButton!) {
        

        
     
//        let ticketsViewController = TicketsViewController()
        guard let url = URL(string: "https://www.aviasales.ru/") else {
            return
        }
        
        let vc = WebViewController(url: url, title: " ")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
//        tabBarController?.selectedIndex = 1
        
        
//        self.dismiss(animated:true, completion: nil)
//        present(TicketsViewController2(), animated: true, completion: nil)
        
//        ticketsViewController.dismiss(animated: false, completion: nil)
        
        
        
//        weak var presentingViewController = self.presentingViewController
//
//        ticketsViewController.dismiss(animated: true, completion: {
//            presentingViewController?.present(ticketsViewController2, animated: false, completion: nil)
//        })

        
      
        
        print("тест:  КУПИТЬ БИЛЕТЫ БИЛЕТЫ")
        
        

    }
    
    
    
    // MARK: - Subviews
    
    let routeImageView = UIImageView()
    let planeImageView = UIImageView()
    let passagerImageView = UIImageView()
    
    var dateView = UIView()
    var ticketView = UIView()
    var ticketLabel = UILabel()
    var departLabel = UILabel()
    var arrivalLabel = UILabel()
    var passengerLabel = UILabel()
    var buyButton = UIButton()
    var fromDateLabel = UILabel()
    var returnDateLabel = UILabel()

    lazy var safeArea = view.safeAreaLayoutGuide
    
    // MARK: - Initializers
    
    deinit {
        print("Deinit ViewController")
    }
    
    // MARK: - Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .systemBlue
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white

        setup()
    }
    
    // MARK: -  Methods
    
    private func setup() {
        buildHierarchy()
        configureSubviews()
        layoutSubviews()
        configurebuyButtonPressed()
    }
    
    private func buildHierarchy() {
        
        view.addSubview(dateView)
        view.addSubview(ticketView)
        dateView.addSubview(fromDateLabel)
        dateView.addSubview(returnDateLabel)
        ticketView.addSubview(routeImageView)
        ticketView.addSubview(planeImageView)
        ticketView.addSubview(passagerImageView)
        ticketView.addSubview(departLabel)
        ticketView.addSubview(arrivalLabel)
        ticketView.addSubview(ticketLabel)
        ticketView.addSubview(passengerLabel)
        ticketView.addSubview(buyButton)
    }
    
    private func configureSubviews() {
        
        dateView.backgroundColor = .systemGray6
        
        ticketView.backgroundColor = .secondarySystemBackground
        
        fromDateLabel.textColor = .black
        fromDateLabel.textAlignment = .center
        fromDateLabel.font = .systemFont(ofSize: 20)
        fromDateLabel.numberOfLines = 0
        fromDateLabel.adjustsFontSizeToFitWidth = true
        
        returnDateLabel.textColor = .black
        returnDateLabel.textAlignment = .center
        returnDateLabel.font = .systemFont(ofSize: 20)
        returnDateLabel.numberOfLines = 0
        returnDateLabel.adjustsFontSizeToFitWidth = true
        
        planeImageView.image = UIImage(systemName: "eurosign")
        planeImageView.tintColor = .systemBlue
        planeImageView.contentMode = .scaleAspectFit
        
        routeImageView.image = UIImage(systemName: "arrow.triangle.swap")
//        routeImageView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        routeImageView.tintColor = .systemBlue
        routeImageView.contentMode = .scaleAspectFit

        passagerImageView.image = UIImage(systemName: "person.2.fill")
        passagerImageView.tintColor = .systemBlue
        passagerImageView.contentMode = .scaleAspectFit

        departLabel.textColor = .black
        departLabel.backgroundColor = .systemGray6
        departLabel.textAlignment = .center
        departLabel.font = .systemFont(ofSize: 20)
        departLabel.numberOfLines = 0
        departLabel.layer.masksToBounds = true
        departLabel.layer.cornerRadius = 15
        
        arrivalLabel.textColor = .black
        arrivalLabel.backgroundColor = .systemGray6
        arrivalLabel.textAlignment = .center
        arrivalLabel.font = .systemFont(ofSize: 20)
        arrivalLabel.numberOfLines = 0
        arrivalLabel.layer.masksToBounds = true
        arrivalLabel.layer.cornerRadius = 15
        
        passengerLabel.textColor = .black
        passengerLabel.backgroundColor = .systemGray6
        passengerLabel.textAlignment = .center
        passengerLabel.font = .systemFont(ofSize: 16)
        passengerLabel.numberOfLines = 0
        passengerLabel.layer.masksToBounds = true
        passengerLabel.layer.cornerRadius = 15
        
        ticketLabel.backgroundColor = .white
        ticketLabel.textColor = .black
        ticketLabel.textAlignment = .center
        ticketLabel.font = .boldSystemFont(ofSize: 28)
        ticketLabel.text = finalTickerPrice
        ticketLabel.numberOfLines = 0
        ticketLabel.adjustsFontSizeToFitWidth = true
        ticketLabel.layer.masksToBounds = true
        ticketLabel.layer.cornerRadius = 16
        ticketLabel.backgroundColor = .systemGray6
        
        buyButton.setTitle("Купить", for:  .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .systemBlue
        
        
    }
    
    private func layoutSubviews() {
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        dateView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        dateView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        dateView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fromDateLabel.translatesAutoresizingMaskIntoConstraints = false
        fromDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor).isActive = true
        fromDateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: 15).isActive = true
        fromDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fromDateLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        returnDateLabel.translatesAutoresizingMaskIntoConstraints = false
        returnDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor).isActive = true
        returnDateLabel.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: -15).isActive = true
        returnDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        returnDateLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        ticketView.translatesAutoresizingMaskIntoConstraints = false
        ticketView.topAnchor.constraint(equalTo: dateView.bottomAnchor).isActive = true
        ticketView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        ticketView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        ticketView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        routeImageView.translatesAutoresizingMaskIntoConstraints = false
        routeImageView.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 25).isActive = true
        routeImageView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 8).isActive = true
        routeImageView.bottomAnchor.constraint(equalTo: arrivalLabel.bottomAnchor).isActive = true
        routeImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        planeImageView.translatesAutoresizingMaskIntoConstraints = false
        planeImageView.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 25).isActive = true
//        busImageView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -15).isActive = true
        planeImageView.centerXAnchor.constraint(equalTo: ticketLabel.centerXAnchor).isActive = true
        planeImageView.bottomAnchor.constraint(equalTo: ticketLabel.topAnchor, constant: -5).isActive = true
        planeImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        departLabel.translatesAutoresizingMaskIntoConstraints = false
        departLabel.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 25).isActive = true
        departLabel.leadingAnchor.constraint(equalTo: routeImageView.trailingAnchor, constant: 8).isActive = true
        departLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        departLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        arrivalLabel.translatesAutoresizingMaskIntoConstraints = false
        arrivalLabel.topAnchor.constraint(equalTo: departLabel.bottomAnchor, constant: 15).isActive = true
        arrivalLabel.leadingAnchor.constraint(equalTo: departLabel.leadingAnchor).isActive = true
        arrivalLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        arrivalLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        passagerImageView.translatesAutoresizingMaskIntoConstraints = false
        passagerImageView.topAnchor.constraint(equalTo: passengerLabel.topAnchor).isActive = true
        passagerImageView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 8).isActive = true
        passagerImageView.bottomAnchor.constraint(equalTo: passengerLabel.bottomAnchor).isActive = true
        //        passagerImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        passagerImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        passengerLabel.translatesAutoresizingMaskIntoConstraints = false
        passengerLabel.topAnchor.constraint(equalTo: arrivalLabel.bottomAnchor, constant: 15).isActive = true
        passengerLabel.leadingAnchor.constraint(equalTo: departLabel.leadingAnchor).isActive = true
        passengerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passengerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        ticketLabel.translatesAutoresizingMaskIntoConstraints = false
        ticketLabel.centerYAnchor.constraint(equalTo: ticketView.centerYAnchor).isActive = true
        ticketLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ticketLabel.leadingAnchor.constraint(equalTo: arrivalLabel.trailingAnchor, constant: 8).isActive = true
        ticketLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -8).isActive = true
        ticketLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        ticketLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        buyButton.topAnchor.constraint(equalTo: ticketLabel.bottomAnchor, constant: 10).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: passengerLabel.trailingAnchor, constant: 8).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -8).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        buyButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buyButton.layer.cornerRadius = 2
    }
    

    }
