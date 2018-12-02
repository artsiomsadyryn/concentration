//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Artyom Sadyrin on 11/15/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = ["Sports": "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🏓🏸",
                  "Animals": "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮",
                  "Faces": "😀😂😇😍😛😎🤓🥶🤯😳😱🤠"]
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    @IBAction func chooseTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController { // только для iPad, если юзер в режиме Split View выбрал другую тему
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
                cvc.title = themeName
            }
        } else if let cvc = lastSeguedToConcentrationViewController { // если уже была начата игра, но юзер перешел Назад и выбрал другую тему
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
                cvc.title = themeName
            }
            navigationController?.pushViewController(cvc, animated: true)
        }
        else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    cvc.title = themeName
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
        
    }
    
}
