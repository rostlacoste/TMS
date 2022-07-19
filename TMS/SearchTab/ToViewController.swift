

import UIKit
import GooglePlaces


let toViewController: ToViewController = ToViewController()


class ToViewController: UIViewController {

    //MARK: - Variables

    let appearance = UINavigationBarAppearance()

    //MARK: - Subviews





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

        configureSubviews()

    }



    func configureSubviews() {




        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Куда"
        self.navigationController?.navigationBar.tintColor = UIColor.white

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        appearance.largeTitleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

    }


}


//MARK: - extension







