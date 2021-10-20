//
//  Story.swift
//  SideMenuIWithCustomShapeSwiftUI
//
//  Created by Sikandar Ali on 20/10/2021.
//

import SwiftUI

    //sample data and story for design
struct Story:Identifiable{
    
    var id = UUID().uuidString
    var image:String
    var title:String
    
}
var stories = [Story(image: "Pic1", title: "Its beautiull place"),
               Story(image: "Pic2", title: "Its beautiull place"),
               Story(image: "Pic3", title: "Its beautiull place"),
               Story(image: "Pic4", title: "Its beautiull place"),
               Story(image: "Pic5", title: "Its beautiull place"),
               Story(image: "Pic6", title: "Its beautiull place"),
               Story(image: "Pic7", title: "Its beautiull place"),
               Story(image: "Pic8", title: "Its beautiull place"),
               Story(image: "Pic9", title: "Its beautiull place"),
               Story(image: "Pic10", title: "Its beautiull place"),
               Story(image: "Pic11", title: "Its beautiull place")]

