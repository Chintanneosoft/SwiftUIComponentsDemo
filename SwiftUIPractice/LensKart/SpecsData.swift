//
//  SpecsData.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

var tabs = ["Glasses","Watched","Shoes","Perfume"]

struct Item: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [
    Item(title:"Vincent Chase", subtitle: "Black Full Rim", price: "$36", rating: "3.6", image: "Spec1"),
    Item(title:"John Jacobs", subtitle: "Brown Tortoise", price: "$45", rating: "4.9", image: "Spec2"),
    Item(title:"Wood Black", subtitle: "Office Glass", price: "$32", rating: "3.8", image: "Spec3"),
    Item(title:"Vu Abstack", subtitle: "Fashion U", price: "$40", rating: "4.3", image: "Spec4")
]
