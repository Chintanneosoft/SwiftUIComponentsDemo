//
//  DemoViewController.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 26/10/23.
//

import UIKit
import SwiftUI
//MARK: - SwiftUI in UIKit
class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnTapped(_ sender: UIButton) {
       
        let swiftUIView: some View = ReusableView()
        let hostingController = UIHostingController(rootView: swiftUIView)
//        present(hostingController, animated: true, completion: nil)
        hostingController.view.center = view.center
        view.addSubview(hostingController.view)
        
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
