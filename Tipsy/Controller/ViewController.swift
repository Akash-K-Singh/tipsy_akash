import UIKit

class ViewController: UIViewController {
    
    var billBrain = BillBrain();

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text = "1"
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if(sender.tag == 0){
            billBrain.tipPercent = 0
            zeroPctButton.isSelected = true
        }else if(sender.tag == 1){
            billBrain.tipPercent = 10
            tenPctButton.isSelected = true
        }else{
            billBrain.tipPercent = 20
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f" ,sender.value)
        billBrain.splitBetween = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billBrain.getBill(bill: billTextField.text!))
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = billBrain.getBill(bill: billTextField.text!)
            destinationVC.tip = String(format: "%.0f" ,billBrain.tipPercent)
            destinationVC.split = String(format: "%.0f" ,billBrain.splitBetween)
        }
    }
}

