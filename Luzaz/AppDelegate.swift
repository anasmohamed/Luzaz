//
//  AppDelegate.swift
//  Luzaz
//
//  Created by jets on 12/1/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import MOLH
import Firebase
import UserNotifications
import Siren
import Toast_Swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable ,UITabBarControllerDelegate  {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    var token = ""
    fileprivate var containerVC = ContainerVC()
    var MenuContainerVC : ContainerVC
    {
        return containerVC
    }
    //let searchVC = OffersViewController()
    // let chatController = UsersChatsViewController()
    //let profileVC = ProfileViewController()
    //let sellYourItemController = SellYourItemViewController()
    //var mainVC : UINavigationController!
    // var chatController : UINavigationController!
    //var thirdTabNavigationController : UINavigationController!
    //var fourthTabNavigationControoller : UINavigationController!
    //var fifthTabNavigationController : UINavigationController!
    let homeItem = UITabBarItem()
    let chatItem = UITabBarItem()
    let profileItem = UITabBarItem()
    let addOfferItem = UITabBarItem()
    let myProductsItem = UITabBarItem()
    var offerDetails = OffersDetailsViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        //     let profileItem = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        //     let sellYourItem = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        //    let profileItem = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        //    let profileItem = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        
        
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        
        
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1.0)
        
        window?.rootViewController = showTabBar()
        
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
        application.registerForRemoteNotifications()
        VersionChecker.shared.isUpdateAvailable() { hasUpdates in
            if hasUpdates{
                self.showError(error:"there is new verstion you can update now")        }
        }
        return true
    }
    func showTabBar() -> UITabBarController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
       
        
        
        
//let containerVCTabBar = storyboard.instantiateViewController(withIdentifier: "ContainerVC") as! ContainerVC
        
        
        let chatController = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        let profileController = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        let sellYourItemController = storyboard.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
        let myProductsController = storyboard.instantiateViewController(withIdentifier: "MyProductsVC") as! MyProductViewController
        
        homeItem.image = UIImage(named: "home-24")
        containerVC.tabBarItem = homeItem
        
        chatItem.image = UIImage(named:"chat-26")
        chatController.tabBarItem = chatItem
        
        profileItem.image = UIImage(named:"profile")
        profileController.tabBarItem = profileItem
        
        addOfferItem.image = UIImage(named:"camera-25")
        sellYourItemController.tabBarItem = addOfferItem
        
        myProductsItem.image = UIImage(named:"price_tag")
        myProductsController.tabBarItem = myProductsItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [containerVC,chatController,profileController,sellYourItemController,myProductsController]
        return tabBarController
    }
    func show(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        self.window?.rootViewController!.present(alertController, animated: true, completion: nil)
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Update".localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Update".localiz(), style: .default) {(_) -> Void in
            UIApplication.shared.openURL(NSURL(string: "https://apps.apple.com/us/app/luzaz-online-store/id1494681890")! as URL)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel".localiz(), style: .default, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.window?.rootViewController!.present(alertController, animated: true, completion: nil)
    }
    
    func reset() {
        //        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        //        let stry = UIStoryboard(name: "Main", bundle: nil)
        //        rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "Con")
        window?.rootViewController = containerVC
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    class func getAppDelegate() -> AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler()
    }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    // [END refresh_token]
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
    }
    
}
