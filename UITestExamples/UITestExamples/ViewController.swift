//
//  ViewController.swift
//  UITestExamples
//
//  Created by steve on 2018-07-13.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var resultButton: UIButton!

  @IBOutlet weak var textField: UITextField!
  @IBAction func buttonTapped() {
    let text = textField.text
    resultButton.setTitle(text, for: .normal)
  }
  
}

