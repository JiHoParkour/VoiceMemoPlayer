//
//  AppComponent.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/29/24.
//

import Foundation

import RIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {
  
  init() {
    super.init(dependency: EmptyComponent())
  }
  
}
