//
//  ViewController.swift
//  Weather
//
//  Created by Павел Курзо on 10.08.22.
//

import UIKit

class RootViewController: UIViewController {
    
    private var rootView: RootView {
        return self.view as! RootView
    }
    
    override func loadView() {
        super.loadView()
        self.view = RootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

