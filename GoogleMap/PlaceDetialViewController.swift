//
//  PlaceDetialViewController.swift
//  GoogleMap
//
//  Created by MCS Devices on 1/4/18.
//  Copyright © 2018 angel. All rights reserved.
//

import UIKit

class PlaceDetialViewController: UIViewController {

    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var name:String?
    var open:String?
    var phoneNum:String?
    var priceLevel:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeName.text = name
        hours.text = open
        phone.text  = phoneNum
        price.text = priceLevel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
