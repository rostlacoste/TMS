

import UIKit

let searchViewController: SearchViewController = SearchViewController()

class SearchViewController: UIViewController {
    
    //MARK: - Variables
    
    private var cellsData: [SearchTableCell] = [
        .init(title: "Откуда", image: nil),
        .init(title: "Куда", image: nil),
        .init(title: "Дата туда", image: nil),
        .init(title: "Дата обратно", image: nil),
        .init(title: "Пассажиры", image: nil),
        .init(title: "Найти билеты", image: nil),
        .init(title: "Безопасные поездки с FlixBus", image: UIImage.init(systemName: "exclamationmark.circle.fill"), url: URL.init(string: "https://flixbus.ru"))
    ]
    
    let appearance = UINavigationBarAppearance()
    
    let dataTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont.systemFont(ofSize: 20)
            return textField
        }()
    
    
    
    //MARK: - Subviews
    let searchTableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
    
    
    
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
        
        view.addSubview(self.searchTableView)
        
    }
    
    
    
    func configureSubviews() {
        
        
        
        searchTableView.register(TableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        searchTableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Найти билеты"
        
        
        
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    
    func setupLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        searchTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    func openUrl(url: URL) {
        UIApplication.shared.open(url)
    }
    
    
}

//MARK: - extension
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cellsData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
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
                case 0: self.navigationController?.pushViewController(fromViewController, animated: true)
                case 1: self.navigationController?.pushViewController(toViewController, animated: true)
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


struct SearchTableCell {
    var title: String
    var image: UIImage?
    var url: URL?
    
}

        

        
        

