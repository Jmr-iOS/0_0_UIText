//
//  ViewController.swift
//  0_1 - UITextField
//  URL: http://stackoverflow.com/questions/24710041/adding-uitextfield-on-uiview-programmatically-swift/32602425#32602425
//
//  see line 12 for delegate add of UITextFieldDelegate
//  see viewDidLoad()
//  see delegate methods on line 69
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 
 
    var sampleTextField : UITextField!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        self.addTextField(self.view);
        self.addDelegate(self);
        
        return;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        return;
    }
    
    
    //todo - add passing the delegate
    func addTextField(view:UIView) {
        
        sampleTextField = UITextField(frame: CGRectMake(20, 100, 300, 40));
        
        sampleTextField.placeholder = "Enter text here, bitches!";
        sampleTextField.font = UIFont.systemFontOfSize(15);
        sampleTextField.borderStyle = UITextBorderStyle.RoundedRect;
        sampleTextField.autocorrectionType = UITextAutocorrectionType.No;
        sampleTextField.keyboardType = UIKeyboardType.Default;
        sampleTextField.returnKeyType = UIReturnKeyType.Done;
        sampleTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center;
        sampleTextField.delegate = self;
        
        sampleTextField.translatesAutoresizingMaskIntoConstraints = true;
        
        view.addSubview(sampleTextField);
        
        
        return;
    }
    
//**********************************************************************************************************************************//
//                                                       UITextFieldDelegate                                                        //
//**********************************************************************************************************************************//
    func addDelegate(delegate : UITextFieldDelegate) {
    
        self.sampleTextField.delegate = self;                               /* be the delegate                                      */
        
        return;
    }
    
    
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        
        sampleTextField.resignFirstResponder();                             /* here is the action which dismisses keyboard          */
        
        print("TimerSubview.textFieldShouldReturn():                  return key pressed and exiting");
        
        return true;                                                        /* normal behavior                                      */
    }


    func textFieldDidBeginEditing   (textField : UITextField) {
        print("TextField did begin editing method called");
        return;
    }
    
    func textFieldDidEndEditing     (textField : UITextField) {
        print("TextField did end editing method called");
        return;
    }
    
    func textFieldShouldBeginEditing(textField : UITextField) -> Bool {
        print("TextField should begin editing method called");
        return true;
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called");
        return true;
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should snd editing method called");
        return true;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called");
        return true;
    }
}

