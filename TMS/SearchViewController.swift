

import UIKit

class SearchViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray6
        tabBarController?.tabBar.backgroundColor = .white
        tabBarController?.tabBar.tintColor = .systemGreen
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Найти билеты"
       
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        
       
        
    }

    
   
    
    
}


