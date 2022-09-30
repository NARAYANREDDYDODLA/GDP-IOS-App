//
//  PaynowViewController.swift
//  Smart_Mobility
//
//  Created by Dodla,Narayan Reddy on 9/29/22.
//

import UIKit
import PassKit

class PaynowViewController: UIViewController {
    
    @IBOutlet weak var btn_pay: UIButton!
    private var paymentRequest : PKPaymentRequest = {
        let request = PKPaymentRequest()
        request.merchantIdentifier = "merchant.gdpproject34@gmail.com"
        request.supportedNetworks = [.quicPay, .masterCard, .visa]
        request.supportedCountries = ["IN", "US"]
        request.merchantCapabilities = .capability3DS
        request.countryCode = "IN"
        request.currencyCode = "INR"
        request.paymentSummaryItems = [PKPaymentSummaryItem(label: "iPhone 13 Pro 128 GB", amount: 123000)]
        
        return request
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_pay.addTarget(self, action: #selector(tapForPay), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc func tapForPay(){
        let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
        if controller != nil {
            controller!.delegate = self
            present(controller!, animated: true, completion: nil)
        }
    }
    
}
extension PaynowViewController : PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


