//
//  ViewController.swift
//  LandMarkBookApp
//
//  Created by AAJM van Montfort on 11/07/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var selectedLandmarkName = String()
    var selectedLandmarkImage = UIImage()
    
    @IBOutlet weak var tvLandMark: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvLandMark.delegate = self
        tvLandMark.dataSource = self
        
        initLandmarkData()
    }
    
    func initLandmarkData() {
        landmarkNames.append("Colloseum")
        landmarkNames.append("Great Wall of China")
        landmarkNames.append("Taj Mahal")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Kremlin")
        
        landmarkImages.append(UIImage(named: "Colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "Great Wall of China.jpg")!)
        landmarkImages.append(UIImage(named: "Taj Mahal.jpg")!)
        landmarkImages.append(UIImage(named: "Stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "Kremlin.jpg")!)
    }

    func deleteLandmarkItem(index: Int) {
        landmarkNames.remove(at: index)
        landmarkImages.remove(at: index)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteLandmarkItem(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLandmarkName = landmarkNames[indexPath.row]
        selectedLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            let destinationViewController = segue.destination as! DetailViewController
            
            destinationViewController.selectedLandmarkName = selectedLandmarkName
            destinationViewController.selectedLandmarkImage = selectedLandmarkImage
        }
    }
}


