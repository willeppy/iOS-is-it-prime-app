//
//  ViewController.swift
//  Is It Prime
//
//  Created by Will Epperson on 9/29/15.
//  Copyright © 2015 Epperson Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var responseLabel: UILabel!
    @IBOutlet var userNumber: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        if let input = Int(userNumber.text!) {
            
            if input <= 0 {
                responseLabel.text = "\(input) is not a valid number. Please enter a positive value."
            }
            else if input == 1 || input == 2 {
                responseLabel.text = "Yes! \(input) is prime."
            } else if isPrime(input){
                responseLabel.text = "Yes! \(input) is prime."
            } else {
                responseLabel.text = "No! \(input) is not prime."
            }
        } else {
            responseLabel.text = "Please enter a positive integer."
        }
    }
    
    // function for prime
    func isPrime(guess:Int) ->Bool {
        
        // prime calculation
        let MAX = guess
        var numbers:[Int] = []
        var primes:[Int] = []
        
        for var i = 3; i <= MAX; i=i+2 {
            numbers.append(i)
        }
        
        let sqrtNum : Int = Int(sqrt(Double(MAX))) + 1
        
        while !numbers.isEmpty && numbers[0] <= sqrtNum {
            
            let front:Int = numbers.removeFirst()
            
            primes.append(front)
            
            for var i = 0; i < numbers.count; i++ {
                if numbers[i] % front == 0 {numbers.removeAtIndex(i)}
            }
        }
        
        // append the rest of the numbers to the prime list
        for rest in numbers {
            primes.append(rest)
        }
        
        if(guess == primes[primes.count - 1] && primes.count > 0) {return true;}
        else {return false}
        
    }
    
    // X Code generated
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

