//
//  WelcomeViewController.swift
//  Basic-Storyboard
//
//  Created by Sahna Melly Marselina on 21/02/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var unwindTextField: UILabel!
    
    var unwindValue: String?
    
    // MARK: LifeCycle
    
    override func loadViewIfNeeded() {
        debugPrint("LifeCycle: loadViewIfNeeded")
        super.loadViewIfNeeded()
    }
    
    override func viewDidLoad() {
        debugPrint("LifeCycle: viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateUnwind()
        view.backgroundColor = .orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("LifeCycle: viewWillAppear")
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        debugPrint("LifeCycle: viewWillLayoutSubviews")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        debugPrint("LifeCycle: viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("LifeCycle: viewDidAppear")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        debugPrint("LifeCycle: viewWillDisappear")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        debugPrint("LifeCycle: viewDidDisappear")
        super.viewDidDisappear(animated)
    }
    
    // MARK: OnClick

    @IBAction func EnterButtonWithoutParamOnClick(_ sender: UIButton) {
        debugPrint("EnterButtonWithoutParamOnClick")
    }
    
    @IBAction func EnterButtonWithParamOnClick(_ sender: UIButton) {
        debugPrint("EnterButtonWithParamOnClick")
        
        debugPrint("TEST0 \(nameTextField.text)")
        debugPrint("TEST1 \(nameTextField.text ?? "kosong")")
        if let tfvalue1 = nameTextField.text, !tfvalue1.isEmpty {
            debugPrint("TEST2 \(tfvalue1)")
        }
        
        guard let tfvalue2 = nameTextField.text, !tfvalue2.isEmpty else {
            let alertController = UIAlertController(
                title: "Error",
                message: "Please put your name!",
                preferredStyle: .alert
            )

            let action = UIAlertAction(
                title: "OK",
                style: .cancel
            )
            
            alertController.addAction(action)

            present(alertController, animated: true, completion: nil)
            
            return
            
                    //            fatalError("textfield is empty")
        }
        
        debugPrint("TEST3 \(tfvalue2)")
        
        performSegue(withIdentifier: "goToPlayerListScreen", sender: self)
    }
    
    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let vc = segue.destination as? PlayerTableViewController {
            let yourName = nameTextField.text ?? "kosong"
            vc.yourname = yourName
        }
    }
    
    @IBAction func unWindToWelcome(_ sender: UIStoryboardSegue) {
        debugPrint("unWindToWelcome")
        populateUnwind()
    }
    
    // MARK: Private Method
    
    private func populateUnwind() {
        unwindTextField.textColor = .white
        if let unwind = unwindValue {
            unwindTextField.text = unwind
            unwindTextField.isHidden = false
        } else {
            unwindTextField.text = "Unwind default"
            unwindTextField.isHidden = true
        }
    }
}
