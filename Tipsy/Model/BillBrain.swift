import Foundation

struct BillBrain{
    
    var tipPercent: Float = 0.0
    var splitBetween: Double = 1
    var bill: String = "0.0"
    var tipAmount: Float?
    
    mutating func getBill(bill : String) -> String{
        self.bill = bill
        tipAmount = ((Float(self.bill) ?? 0.0) * (self.tipPercent))/100
        let costPerHead = String((tipAmount! + (Float(self.bill) ?? 0.0)) / (Float(self.splitBetween)))
        return costPerHead
    }
}
