

import UIKit

let settingsViewController:SettingsViewController = SettingsViewController()


final class SettingsViewController: UIViewController {
    
    //MARK: - Variables
    
    private var cellsData: [SettingsTableCell] = [
        
        .init(title: "Получать предложения на почту", currencySwitch: nil),
        
    ]
    
    //MARK: - Subviews
    
    let settingsTableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
    
     
    
   
    //MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        func hideTabBar() {
            var frame = self.tabBarController?.tabBar.frame
            frame!.origin.y = self.view.frame.size.height + (frame?.size.height)!
            UIView.animate(withDuration: 0.5, animations: {
                self.tabBarController?.tabBar.frame = frame!
            })
        }
        hideTabBar()
        
        
    }
    
    
    
    //MARK: - Setup
    func setup() {
        buildHierarchy()
        configureSubviews()
        setupLayouts()
    }
    
    func buildHierarchy() {
        
        view.addSubview(self.settingsTableView)
        
    }
    
    func configureSubviews() {
        
        settingsTableView.register(TableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        
        settingsTableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
        navigationItem.title = "Настройки"
        self.navigationController?.navigationBar.tintColor = UIColor.white

    }

    func setupLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
   
    
    
    

}


//MARK: - extension

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        cell.textLabel?.text = self.cellsData[indexPath.row].title
    
        
       let messagesSwitch = UISwitch()
        messagesSwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
        messagesSwitch.isOn = false
        cell.accessoryView = messagesSwitch
        
        
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("получать сообщения")

            // Create new Alert
            let dialogMessage = UIAlertController(title: "", message: "Теперь вы подписаны на самые горячие предложения", preferredStyle: .alert)
             
             // Create OK button with action handler
             let ok = UIAlertAction(title: "Супер!", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
              })
             
             //Add OK button to a dialog message
             dialogMessage.addAction(ok)

             // Present Alert to
             self.present(dialogMessage, animated: true, completion: nil)
            
            
            
        }
        else {
            print("не получать сообщения")
        }
    }
    
}

private class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageView?.image = nil
    }
}

struct SettingsTableCell {
    var title: String
    var currencySwitch: UISwitch?
    
}
