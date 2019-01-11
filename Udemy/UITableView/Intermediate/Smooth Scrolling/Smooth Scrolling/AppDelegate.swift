//
//  AppDelegate.swift
//  Smooth Scrolling
//
//  Created by Ben Sullivan on 14/01/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

var images = [#imageLiteral(resourceName: "img1"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9"), #imageLiteral(resourceName: "1c"),#imageLiteral(resourceName: "2c"),#imageLiteral(resourceName: "3c"),#imageLiteral(resourceName: "4c"),#imageLiteral(resourceName: "5c"),#imageLiteral(resourceName: "6c"),#imageLiteral(resourceName: "7c"),#imageLiteral(resourceName: "8c"),#imageLiteral(resourceName: "9c")]

func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
  
  let scale = newWidth / image.size.width
  let newHeight = image.size.height * scale
  UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
  image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
  let newImage = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
  
  return newImage!
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
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


}

