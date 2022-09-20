

import UIKit



final class HelpViewController: UIViewController {
    
    //MARK: - Variables
    private var cellsData: [HelpTableCell] = [
        .init(title: "Нужна помощь?", image: nil, url: URL.init(string: "https://www.aviasales.ru/faq")),
        .init(title: "Общие положения и условия", image: nil, url: URL.init(string: "https://www.aviasales.ru/about")),
        .init(title: "Политика конфиденциальности", image: nil, url: URL.init(string: "https://www.aviasales.ru/privacy")),
    
        
        .init(title: "Настройки", image: UIImage.init(systemName: "gearshape.fill")),
        
    ]
    
    let appearance = UINavigationBarAppearance()
    
    
    //MARK: - Subviews
    let helpTableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
    
    
        

     
    
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
                self.tabBarController?.tabBar.backgroundColor = .systemGray6
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
        
        view.addSubview(self.helpTableView)
        
    }
    
    
    
    func configureSubviews() {
        
        helpTableView.register(TableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        helpTableView.dataSource = self
        helpTableView.delegate = self
        
        helpTableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Помощь"
        
        
        
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    
    func setupLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        helpTableView.translatesAutoresizingMaskIntoConstraints = false
        helpTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        helpTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        helpTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        helpTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    func openUrl(url: URL) {
        UIApplication.shared.open(url)
    }
    
    
}

//MARK: - extension
extension HelpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cellsData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = helpTableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        cell.textLabel?.text = self.cellsData[indexPath.row].title
        
        if cellsData[indexPath.row].image != nil {
            cell.imageView?.image = cellsData[indexPath.row].image
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .systemGray6
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = cellsData[indexPath.row].url {
            openUrl(url: url)
        }
        
                switch indexPath.row {
                case 3: self.navigationController?.pushViewController(settingsViewController, animated: true)
                default:
                    return
                }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}



private class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        

    }
    
}


struct HelpTableCell {
    var title: String
    var image: UIImage?
    var url: URL?
}
