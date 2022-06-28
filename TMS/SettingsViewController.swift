

import UIKit

let settingsViewController:SettingsViewController = SettingsViewController()


class SettingsViewController: UIViewController {
    
    //MARK: - Variables
    
    private var cellsData: [SettingsTableCell] = [
        .init(title: "Валюта", switcher: false),
        .init(title: "Встроенные сообщения", switcher: true),
        .init(title: "Настройки конфиденциальности", switcher: false),
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
    
       
        
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .systemGray6
        return cell
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
    var switcher: Bool
    
}
