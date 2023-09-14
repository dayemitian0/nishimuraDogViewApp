//
//  SingleDogImageViewController.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/14.
//

import UIKit

class SingleDogImageViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ダブルタップ
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(tappdDouble(sender:)))
        doubleTap.numberOfTapsRequired = 2
        self.dogImageView.addGestureRecognizer(doubleTap)
    }
    
    
    @objc func tappdDouble(sender: UITapGestureRecognizer!){
        print("doubleTapped")
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
