//
//  WelcomeViewModel.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/19/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var Description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(Description: "Hi my name is Cam", imageUrl: "WelcomePageSecond", tag: 0)
    
    static var samplePages: [Page] = [
        Page(Description: "Welcome to Reel Talk, a community designed for true film and TV Show fans", imageUrl: "WelcomePageFirst", tag: 0),
        Page(Description: "Discover and discuss your favorite films, movies, and shows", imageUrl: "WelcomePageSecond", tag: 1),
        Page(Description: "Let's get started!", imageUrl: "WelcomePageThird", tag: 2),
    ]
}
