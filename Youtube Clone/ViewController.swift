//
//  ViewController.swift
//  Youtube Clone
//
//  Created by muhammad abdul latief on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  var model = Model()

  override func viewDidLoad() {
    super.viewDidLoad()
    model.getVideos()
  }


}

