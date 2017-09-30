//
//  EmotionsViewController.swift
//  Faceit
//
//  Created by Bruce Burgess on 7/22/17.
//  Copyright © 2017 Red Raven COmputing. All rights reserved.
//

import UIKit

class EmotionsViewController: VCLLoggingViewController {
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        if let faceViewController = destinationViewController as? FaceViewController,
            let identifier = segue.identifier,
            let experession = emotionalFaces[identifier] {
                faceViewController.expression = experession
                faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
    
    
    
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad" : FacialExpression(eyes: .closed, mouth: .frown),
        "happy" : FacialExpression(eyes: .open, mouth: .smile),
        "worried" : FacialExpression(eyes: .open, mouth: .smirk)
    ]
    

}
