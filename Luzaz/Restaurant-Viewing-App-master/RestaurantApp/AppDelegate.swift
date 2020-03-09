//
//  AppDelegate.swift
//  YelpApp
//
//  Created by Anas Mohamed on 2/25/20.
//  Copyright © 2018 Gary Tokman. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
      private let apiKey = "mldpmLQuqUJ4DygaUiyx6YNK1mOueffPMqABMlUL__0ONDezoWwCYlN5v3i6N2KHZvh0iLJejqVImWj-lTSLUtRdjWictsXu5QwPHaMqO4AMcsScNHr7EzrSpkggXnYx"
        let window = UIWindow()
        let locationService = LocationService()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let jsonDecoder = JSONDecoder()
        var navigationController: UINavigationController?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            locationService.didChangeStatus = { [weak self] success in
                if success {
                    self?.locationService.getLocation()
                }
            }
            
            locationService.newLocation = { [weak self] result in
                switch result {
                case .success(let location):
                    self?.loadBusinesses(with: location.coordinate)
                case .failure(let error):
                    assertionFailure("Error getting the users location \(error)")
                }
            }
            
            switch locationService.status {
            case .notDetermined, .denied, .restricted:
                let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
                locationViewController?.delegate = self
                window.rootViewController = locationViewController
            default:
                let nav = storyboard
                    .instantiateViewController(withIdentifier: "RestaurantNavigationController") as? UINavigationController
                self.navigationController = nav
                window.rootViewController = nav
                locationService.getLocation()
                (nav?.topViewController as? RestaurantTableViewController)?.delegete = self
            }
            window.makeKeyAndVisible()
            
            return true
        }
        func loadDetails(viewController: UIViewController,id : String)
        {print(id)
            
            let serverURL = "https://api.yelp.com/v3/businesses/\(id)"
            var request = URLRequest(url: URL(string: serverURL)!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print(error)
                // check for fundamental networking error
                guard let data = data, error == nil else {
                    
                    return
                }
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print(httpStatus)
                    return
                }
                print("data\(data)")
                if let details = try? self.jsonDecoder.decode(Details.self, from: data) {
                    DispatchQueue.main.async {
                        let detailsViewModel = DetailsViewModel(details: details)
                        
                        (viewController as? DetailsFoodViewController)?.viewModel = detailsViewModel
                    }
                    
                }
                
            }
            task.resume()
        }
        
        func loadBusinesses(with coordinate: CLLocationCoordinate2D)
        {
            let serverURL = "https://api.yelp.com/v3/businesses/search?latitude=\(coordinate.latitude)&longitude=\(coordinate.longitude)&limit=10"
            var request = URLRequest(url: URL(string: serverURL)!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    
                    return
                }
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("httpStatus \(httpStatus)")
                    return
                }
                
                let root = try! self.jsonDecoder.decode(Root.self, from: data)
                let viewModels = root.businesses
                    .compactMap(RestaurantListViewModel.init)
                    .sorted(by: { $0.distance < $1.distance })
                DispatchQueue.main.async {
                    if let nav = self.window.rootViewController as? UINavigationController,
                        let restaurantListViewController = nav.topViewController as? RestaurantTableViewController {
                        if viewModels.count > 0 {
                            restaurantListViewController.viewModels = viewModels
                        }
                    } else if let nav = self.storyboard
                        .instantiateViewController(withIdentifier: "RestaurantNavigationController") as? UINavigationController {
                        self.navigationController = nav
                        self.window.rootViewController?.present(nav, animated: true) {
                            
                            (nav.topViewController as? RestaurantTableViewController)?.viewModels = viewModels
                        }
                    }
                }
            }
            task.resume()
        }
    }

    extension AppDelegate: LocationActions, ListActions {
        func didTapAllow() {
            locationService.requestLocationAuthorization()
        }
        
        func didTapCell(_ viewController: UIViewController, viewModel: RestaurantListViewModel) {
            loadDetails(viewController: viewController, id: viewModel.id)
        }
    }
