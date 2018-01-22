/************************************************************************************************************************************/
/** @file       ViewController.swift
 *  @project    0_1 - UIText
 *  @brief      x
 *  @details    x
 *
 *  @author     Justin Reina, Firmware Engineer, Jaostech
 *  @created    11/05/17
 *  @last rev   1/22/18
 *
 *  @section    Reference
 *      http://stackoverflow.com/questions/24710041/adding-uitextfield-on-uiview-programmatically-swift/32602425#32602425
 *
 *  @section    Opens
 *      add vertical alignment
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
        
        //Add labels
        addLabels(self.view);
        
        //Add orientation examples
        addVerticalText(self.view);
        addRotatedText(self.view);
        
        //Add response
        addDelegate(self);
        
        //Split example
        splitExample();
        
        print("ViewController.viewDidLoad():  load complete");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addVerticalText(_ view : UIView)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addVerticalText(_ view : UIView) {
        print("todo");
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        addRotatedText(_ view : UIView)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addRotatedText(_ view : UIView) {
        print("todo");
        return;
    };
    
    
    /********************************************************************************************************************************/
    /** @fcn        addTextField(_ view:UIView)
     *  @brief      x
     *  @details    x
     *  @todo      add passing the delegate
     */
    /********************************************************************************************************************************/
    func addTextField(_ view:UIView) {
        
        let fieldFrame = CGRect(x: 20, y: 100, width: 300, height: 40);
        
        //Init
        sampleTextField = UITextField(frame: fieldFrame);                                       /* init new field                   */
        
        //Setup
        sampleTextField.font = UIFont.systemFont(ofSize: 15);                                   /* set font                         */
        sampleTextField.borderStyle = UITextBorderStyle.roundedRect;                            /* apply rounded edges to frame     */
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no;                       /* disable auto-correct             */
        sampleTextField.keyboardType = UIKeyboardType.default;                                  /* select normal default keyboard   */
        sampleTextField.returnKeyType = UIReturnKeyType.done;                                   /* set return key type              */
        sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;                     /* only show 'x' when editing       */
        sampleTextField.textAlignment = .left;                                                  /* set alignment of text            */
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center;    /* apply vertical alignment         */
        sampleTextField.translatesAutoresizingMaskIntoConstraints = true;                       /* allow constraints                */
        sampleTextField.delegate = self;                                                        /* set delegate for response        */
        
        //Text
        sampleTextField.text = nil;                                                             /* left empty for placeholder       */
        sampleTextField.placeholder = "Enter text here, bitches!";                              /* text shown when empty            */


        //Add to view
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

        let viewFrame = CGRect(x: 20, y: 200, width: 290, height: 300);
        
        //Init
        let sampleTextView = UITextView(frame: viewFrame);                                      /* init new field                   */
        
        
        //Setup
        sampleTextView.font = UIFont.systemFont(ofSize: 11);                                    /* set font                         */
        sampleTextView.keyboardType  = UIKeyboardType.default;                                  /* select normal default keyboard   */
        sampleTextView.returnKeyType = UIReturnKeyType.done;                                    /* set return key type              */
        sampleTextView.textAlignment = .left;                                                   /* set alignment of text            */
        sampleTextView.translatesAutoresizingMaskIntoConstraints = true;                        /* allow constraints                */
        sampleTextView.backgroundColor = UIColor.purple;                                        /* set background color of view     */
        sampleTextView.isEditable    = false;                                                   /* user text editing                */
        sampleTextView.isSelectable  = false;                                                   /* user can select                  */
        sampleTextView.isScrollEnabled = false;                                                 /* user can scroll                  */
        
        //Text
        sampleTextView.text = "Enter the TextView text here \n many, many lines of it!";        /* set text value                   */
        for i in 0...15 {
            sampleTextView.text = sampleTextView.text +  String("line[\(i)] - And then there is a lot of text next to it...! :)\n");
        }

        //Customize view
        applyCorners(sampleTextView);
        
        //Add to view
        view.addSubview(sampleTextView);
        
        print("ViewController.addTextView():  textview added to the view");
        
        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        addLabels(_ view:UIView)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addLabels(_ view : UIView) {
    
        //TextField Label
        let fieldLabel : UILabel = UILabel(frame: CGRect(x: 20, y: 65, width: 300, height: 40));
        fieldLabel.font = FontUtils.updateFont(fieldLabel.font, [.bold, .italic])       /* set to bold-italic                       */
        fieldLabel.text = "TextField";
    
        //TextView Label
        let viewLabel : UILabel = UILabel(frame: CGRect(x: 20, y: 165, width: 300, height: 40));
        viewLabel.font = FontUtils.updateFont(viewLabel.font, [.bold]);
        viewLabel.text = "TextView";

        //Add views
        view.addSubview(fieldLabel);
        view.addSubview(viewLabel);
        
        print("ViewController.addLabels():    labels added to the view");
        
        return;
    }

    
    /********************************************************************************************************************************/
    /** @fcn        applyCorners(_ view : UIView)
     *  @brief      apply rounded corners to a view
     *  @details    x
     */
    /********************************************************************************************************************************/
    func applyCorners(_ view : UIView) {
        
        view.clipsToBounds      = true;                                          /* needed for corners                           */
        view.layer.cornerRadius = 12;                                            /* apply rounded corners to view edges          */
        
        print("ViewController.applyCorners(): corners applied to the view");

        return;
    }
    
    
    /********************************************************************************************************************************/
    /** @fcn        splitExample()
     *  @brief      demonstration of how to split a string
     *  @details    x
     */
    /********************************************************************************************************************************/
    func splitExample() {
        let nameArr : [String] =  "firstField secondField thirdField".split{$0 == " "}.map(String.init);
        
        print("ViewController.splitExample:   \(nameArr[0]), \(nameArr[1]), \(nameArr[2])");
        
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
        print("ViewController.DidEnd():        textField did end editing method called");
        return;
    }
    
    func textFieldShouldBeginEditing(_ textField : UITextField) -> Bool {
        print("ViewController.ShouldBegin():  permission granted for editing text");
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("ViewController.ShouldClear():  textField should clear method called");
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ViewController.ShouldEnd():    textField should end editing method called");
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("ViewController.textField():    text was entered (\(string))");
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

