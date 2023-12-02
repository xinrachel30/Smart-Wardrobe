//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import Foundation

struct weatherResponse: Codable {
    let response: [String: [String]]
}

let response = ["tops": ["Red Sweater"],
    "bottoms": ["Jeans", "Leggings"],
    "shoes": ["Winter Boots"]]


//response["tops"] => ["Red Sweater"]

