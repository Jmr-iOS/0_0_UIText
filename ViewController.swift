/************************************************************************************************************************************/
/** @file       ViewController.swift
 *  @project    0_1 - UIText
 *  @brief      x
 *  @details    x
 *
 *  @author     Justin Reina, Firmware Engineer, Jaostech
 *  @created    11/05/17
 *  @last rev   1/1/18
 *
 *  @section    Reference
 *      http://stackoverflow.com/questions/24710041/adding-uitextfield-on-uiview-programmatically-swift/32602425#32602425
 *
 *  @section    Opens
 *      Add italics & bold
 *      Push italics & bold to Lib
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
 
    var sampleTextField : UITextField!;
 
    
    /********************************************************************************************************************************/
    /** @fcn        viewDidLoad()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        //Add views
        addTextField(self.view);
        addTextView(self.view);
        
        //Add response
        addDelegate(self);
        
        print("ViewController.viewDidLoad():  load complete");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addTextField(_ view:UIView)
     *  @brief      x
     *  @details    x
     *  @todo      add passing the delegate
     */
    /********************************************************************************************************************************/
    
    @objc func addTextField(_ view:UIView) {
        
        sampleTextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40));
        
        sampleTextField.placeholder = "Enter text here, bitches!";
        sampleTextField.font = UIFont.systemFont(ofSize: 15);
        sampleTextField.borderStyle = UITextBorderStyle.roundedRect;
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no;
        sampleTextField.keyboardType = UIKeyboardType.default;
        sampleTextField.returnKeyType = UIReturnKeyType.done;
        sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center;
        sampleTextField.delegate = self;
        
        sampleTextField.translatesAutoresizingMaskIntoConstraints = true;
        
        view.addSubview(sampleTextField);
        
        print("ViewController.addTextField(): textfield added to the view");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addTextView(_ view:UIView)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addTextView(_ view:UIView) {
        
        let sampleTextView = UITextView(frame: CGRect(x: 20, y: 200, width: 290, height: 300));
        
        sampleTextView.textAlignment = .left;
        
        sampleTextView.backgroundColor = UIColor.purple;
        
        
        sampleTextView.text = "Enter the TextView text here \n many, many lines of it!";
        
        for i in 0...50 {
            sampleTextView.text = sampleTextView.text +  String("line[\(i)] - And then there is a lot of text next to it...! :)\n");
        }
        
        sampleTextView.font = UIFont.systemFont(ofSize: 11);
        sampleTextView.autocorrectionType = UITextAutocorrectionType.no;
        sampleTextView.keyboardType  = UIKeyboardType.default;
        sampleTextView.returnKeyType = UIReturnKeyType.done;
        sampleTextView.isEditable    = false;                                   /* user text editing                                */
        sampleTextView.isSelectable  = false;                                   /* user can select                                  */
        sampleTextView.isScrollEnabled = false;                                 /* user can scroll                                  */
        
        sampleTextView.translatesAutoresizingMaskIntoConstraints = true;
        view.addSubview(sampleTextView);
        
        sampleTextView.backgroundColor = UIColor.purple;
        
        print("ViewController.addTextView():  textview added to the view");
        
        return;
    }
    
    
//**********************************************************************************************************************************//
//                                                       UITextFieldDelegate                                                        //
//**********************************************************************************************************************************//
    @objc func addDelegate(_ delegate : UITextFieldDelegate) {
    
        self.sampleTextField.delegate = self;                               /* be the delegate                                      */
        
        print("ViewController.addDelegate():  delegate was assigned to the textfield");
        
        return;
    }
    
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        
        sampleTextField.resignFirstResponder();                             /* here is the action which dismisses keyboard          */
        
        print("ViewController.textFieldShouldReturn():                  return key pressed and exiting");
        
        return true;                                                        /* normal behavior                                      */
    }


    func textFieldDidBeginEditing   (_ textField : UITextField) { 
        print("ViewController.DidBegin():     editing of textfield began");
        return;
    }
    
    func textFieldDidEndEditing     (_ textField : UITextField) {
        print("ViewController.DidEnd():  2TextField did end editing method called");
        return;
    }
    
    func textFieldShouldBeginEditing(_ textField : UITextField) -> Bool {
        print("ViewController.ShouldBegin():  permission granted for editing text");
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("ViewController.ShouldClear():  4TextField should clear method called");
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ViewController.ShouldEnd():  5TextField should end editing method called");
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("ViewController.textField():  text was entered (\(string))");
        return true;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        override func didReceiveMemoryWarning()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        return;
    }
}

