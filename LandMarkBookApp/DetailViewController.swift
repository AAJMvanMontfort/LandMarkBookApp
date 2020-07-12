//
//  DetailViewController.swift
//  LandMarkBookApp
//
//  Created by AAJM van Montfort on 12/07/2020.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedLandmarkName = String()
    var selectedLandmarkImage = UIImage()
    
    @IBOutlet weak var ivLandmarkImage: UIImageView!
    @IBOutlet weak var lblLandmarkName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup afterloading the view.
        
        lblLandmarkName.text = selectedLandmarkName
        ivLandmarkImage.image = selectedLandmarkImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
