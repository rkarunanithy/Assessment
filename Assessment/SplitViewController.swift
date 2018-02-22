//
//  SplitViewController.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 30/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit


class SplitViewController: UISplitViewController,UISplitViewControllerDelegate {

    //var response : ScreenResponse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        
        print("Inside SplitView Controller**********")
        
        if let nc = secondaryViewController as? UINavigationController {
            if let topVc = nc.topViewController {
                if topVc is DetailViewController {
                    //let hasDetail = false Thing.noThing !== dc.thing
                    //let hasDetails = false
                    return true
                }
            }
        }
        return true
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


