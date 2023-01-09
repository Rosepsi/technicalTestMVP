//
//  AppDelegate.swift
//  technicalTestMVP
//
//  Created by Rosa Herrero on 22/12/22.
//

import UIKit

/*
 List to do:
 
 - Requisitos:
    - Total cada transacción quitando comisión
    - Comentarios
 
 - Una pantalla con tabla
 
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window =  UIWindow(frame: UIScreen.main.bounds)
        setup()
        return true
    }
    
    func setup () {
        let rootController = TransactionsView(nibName: nil, bundle: nil)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }

}

