//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Artyom Sadyrin on 11/15/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = ["Sports": "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🏓🏸",
                  "Animals": "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮",
                  "Faces": "😀😂😇😍😛😎🤓🥶🤯😳😱🤠"]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
        
    }
    

}
