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
    - Parte superior última transacción
    - Resto de transacciones ordenadas por fecha
    - Total cada transacción quitando comisión
    - Verde ingresos / Rojo gastos
    - No transacción con formato inválido
    - Transacción más reciente con el mismo id
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
        let rootController = TransactionsPresenter ()
        window?.rootViewController = rootController.view
        window?.makeKeyAndVisible()
    }

}

