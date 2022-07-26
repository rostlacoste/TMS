
import UIKit
import GooglePlaces
import MapKit

let toViewController: ToViewController = ToViewController()


class ToViewController: UIViewController, UISearchResultsUpdating {
    
    
    
    //MARK: - Variables
    
    let mapView = MKMapView()
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    var resultsViewController: GMSAutocompleteResultsViewController!
    
    var resultView: UITextView?
    
    let appearance = UINavigationBarAppearance()
    
    private var placesClient: GMSPlacesClient!
    
    
    //MARK: - Subviews
    
    
    
    
    //MARK: - Life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        
        
        
        
        placesClient = GMSPlacesClient.shared()
        resultsViewController = GMSAutocompleteResultsViewController()
        
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
        
        
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
        
        setup()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.tabBarController?.tabBar.layer.zPosition = -1
        
        func hideTabBar() {
            var frame = self.tabBarController?.tabBar.frame
            frame!.origin.y = self.view.frame.size.height + (frame?.size.height)!
            UIView.animate(withDuration: 0.5, animations: {
                self.tabBarController?.tabBar.frame = frame!
            })
        }
        hideTabBar()
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayouts()
        
        
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
        
        
        
        searchVC.searchBar.searchBarStyle = .default
        searchVC.searchBar.tintColor = .white
        searchVC.searchBar.barTintColor = .white
        searchVC.searchBar.backgroundColor = .systemGreen
        searchVC.searchBar.placeholder = "Куда"
        searchVC.hidesNavigationBarDuringPresentation = false
        
        
        if let textfield = searchVC.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            textfield.tintColor = .systemGreen
        }
        
        
        
        
        
        
    }
    
    
    func setupLayouts() {
        
        mapView.frame = view.bounds
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultsVC = searchController.searchResultsController as? ResultsViewController
        else {
            return
        }
        
        resultsVC.delegate = self
        
        GooglePlacesManager.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
    
}


//MARK: - extension


extension ToViewController: ResultsViewControllerDelegate {
    
    
    func didTapPlace(with coordinates: CLLocationCoordinate2D) {
        
        searchVC.searchBar.resignFirstResponder()
        searchVC.dismiss(animated: true, completion: nil)
        
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        mapView.setRegion(MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2)
        ),animated: true)
    }
    
}











