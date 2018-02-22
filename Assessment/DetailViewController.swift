//
//  DetailViewController.swift
//  Assessment
//
//  Created by Ravisankar Karunanithy on 29/01/18.
//  Copyright © 2018 RKarunanithy. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel!
    
    //var thing : Thing = Thing.noThing
    var screenResponse : ScreenResponse? = nil
    
    // weak var delegate: DetailViewControllerDelegate?
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.title = "Assessment"
        //self.view.backgroundColor = UIColor.red
        
        if self.splitViewController != nil {
            
          /*  let ni = self.navigationItem
            ni.setLeftBarButton(svc.displayModeButtonItem, animated: false)
            ni.leftItemsSupplementBackButton = true;*/
            
        }
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadView(screen : Screen, tab : Tabs){
        self.title = screen.name
        
        print(screen)
        //let tabId  = screen.tabsList[tabInd].id ;
        let tabIdStr = String(tab.id)
        let formList = screen.tabFormMap[tabIdStr];
        
        for form in formList! {
        //let form = formList![0]
            let formIdStr = String(form.id)
            
            let fieldList = screen.formFieldMap[formIdStr]
            
            let dropDownData = [ "ValueOne", "ValueTwo", "ValueThree", "ValueFour" ]
            var x = 0,y=0,width = 500, height = 500
            for field in fieldList! {
               
                let labelView = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
                // self.automaticallyAdjustsScrollViewInsets = false
                labelView.text = field.title
               // textView.center = self.view.center
                //textView.textAlignment = NSTextAlignment.justified
                //textView.textColor = UIColor.blue
                //textView.backgroundColor = UIColor.lightGray
                
                view.addSubview(labelView)
                x = Int(labelView.frame.origin.x);
                y = Int(labelView.frame.origin.y + 10);
                
                let textView = UITextView(frame: CGRect(x: x , y: y, width: width, height: height))
                
                //view.addSubview(textView)
                y = y + 50
                let dropDownController = DropDownController()
                dropDownController.setPrevView(view: labelView)
                dropDownController.setData(data: dropDownData)
                addChildViewController(dropDownController)
                let buttonView = dropDownController.createButton()
                view.addSubview(buttonView)
                let dropDownView = dropDownController.createDropDown()
                view.addSubview(dropDownView)
               
               
            }
            
        }
       
        
        
    }
    
}

    



