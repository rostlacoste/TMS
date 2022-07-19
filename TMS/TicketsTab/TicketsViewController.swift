

import UIKit

class TicketsViewController: UIViewController {

    

    
    let label: UILabel = {
        let label = UILabel()
        label.text = "У вас еще нет билетов"
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ЗАБРОНИРУЙТЕ БИЛЕТЫ СЕЙЧАС!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.titleLabel!.font = UIFont(name: "Arial Bold", size: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        

        
        return button
    }()
    
    let noTicketsImageView = UIImageView()
    
    func configureButton() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        print("тест: должно кидать первый экран Поиск")
        tabBarController?.selectedIndex = 0
        
         }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Билеты"
        
        
        let ticketsImage = UIImage(named: "notickets")
        noTicketsImageView.image = ticketsImage
        noTicketsImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        
        noTicketsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        
        view.addSubview(noTicketsImageView)
        view.addSubview(button)
        view.addSubview(label)
        setupView1()
        setupButton()
        setupLabel()
        configureButton()
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    func setupView1() {

        noTicketsImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        noTicketsImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        noTicketsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
        noTicketsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLabel() {
//        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 44).isActive = true
        label.topAnchor.constraint(equalTo: noTicketsImageView.bottomAnchor, constant: 16).isActive = true
    }
    
    func setupButton() {
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
  
        
    }
    
   
    
    
    
}
