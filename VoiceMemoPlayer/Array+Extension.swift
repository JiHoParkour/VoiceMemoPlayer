//
//  Array+Extension.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/30/24.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
