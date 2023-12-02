//
//  ViewController.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 11/29/23.
//

import Foundation

struct weatherResponse: Codable {
    var tops: [String]
    var bottoms: [String]
    var shoes: [String]
    var response: [String: [String]]
}

//response["tops"] => ["Red Sweater"]

