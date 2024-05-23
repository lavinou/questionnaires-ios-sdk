//
//  File.swift
//  
//
//  Created by Vincent Turnier on 5/22/24.
//

import Foundation
import UIKit

class QuestionnaireViewController : UIViewController {
    
    lazy var questionnaireView = QuestionnaireUIView()
    
    override func loadView() {
        self.view = questionnaireView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
