//
//  Screen.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 30/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit


class Screen: Decodable {
    var  id : Int = 0
    var name : String
    var tabsList : [Tabs] = []
    var tabFormMap = [String : [Form]]()
    var formFieldMap = [String : [Field]]()
    
    func printObj(){
        print("The Id  \(id))")
        
        for tab in tabsList {
            tab.printObj()
        }
        for (_, forms) in tabFormMap {
            for form in forms {
                form.printObj()
            }
            
        }
        
        for (_, fields) in formFieldMap {
            for field in fields {
                field.printObj()
            }
            
        }
    }
}

