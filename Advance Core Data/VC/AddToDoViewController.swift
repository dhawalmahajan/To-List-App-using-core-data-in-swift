//
//  AddToDoViewController.swift
//  Advance Core Data
//
//  Created by Dhawal Mahajan on 16/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    //MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    var todo: Todo?
    
    //UI Outlets
    @IBOutlet var doneBtn: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var textView: UITextView!
    
    //Constraint Outlets
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    //MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsAndTextView()
    }
    
    //MARK: Functions
    
    fileprivate func notificationsAndTextView() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow(with:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil
        )
        textView.becomeFirstResponder()
        if let todo = todo {
            textView.text = todo.title
            textView.text = todo.title
            segmentedControl.selectedSegmentIndex = Int(todo.priority)
        }
    }
    
    @objc func keyBoardWillShow(with notification: Notification) {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyBoardFrame = notification.userInfo?[key] as? NSValue else { return }
        let keyBoardHeight = keyBoardFrame.cgRectValue.height + 16
        bottomConstraint.constant = keyBoardHeight
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    fileprivate func notificationsAndtextView() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow(with:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil
        )
        textView.becomeFirstResponder()
        if let todo = todo {
            textView.text = todo.title
            textView.text = todo.title
            segmentedControl.selectedSegmentIndex = Int(todo.priority)
        }
    }
    
    
    func doneBtnActions() {
        guard let title = textView.text, !title.isEmpty else { return }
        if let todo = self.todo {
            todo.title = title
            todo.priority = Int16(segmentedControl.selectedSegmentIndex)
        } else {
            let todo = Todo(context: managedObjectContext)
            todo.title = title
            todo.priority = Int16(segmentedControl.selectedSegmentIndex)
            todo.date = Date()
        }
        do {
            try managedObjectContext.save()
            dismissTheVc()
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    //MARK: IbActions

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            //cancel Button
            dismissTheVc()
            break
        case 1:
            // Done Button
          doneBtnActions()
            break
        default:
            break
        }
    }
    
    fileprivate func dismissTheVc() {
        dismiss(animated: true)
        textView.resignFirstResponder()
    }
}

//MARK: Textfield Delegate Methods

extension AddToDoViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneBtn.isHidden {
            textView.text.removeAll()
            textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            doneBtn.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
