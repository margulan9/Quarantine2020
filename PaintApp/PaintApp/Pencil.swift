//
//  Pencil.swift
//  PaintApp
//
//  Created by Sugirbay Margulan on 4/5/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import Foundation
import UIKit

enum Pencil {
  case black
  case grey
  case red
  case lightBlue
  case lightGreen
  case brown
  case orange
  case pink
  case yellow
    
  init?(tag: Int) {
    switch tag {
    case 1:
      self = .red
    case 2:
      self = .lightGreen
    case 3:
      self = .lightBlue
    case 4:
        self = .black
    case 5:
      self = .orange
    case 6:
      self = .pink
    case 7:
        self = .grey
    case 8:
      self = .brown
    case 9:
        self = .yellow
    default:
      return nil
    }
  }
    var color: UIColor {
      switch self {
      case .black:
        return .black
      case .grey:
        return UIColor(white: 105/255.0, alpha: 1.0)
      case .red:
        return UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
      case .pink:
        return .systemPink
      case .lightBlue:
        return .blue
      case .lightGreen:
        return UIColor(red: 102/255.0, green: 1, blue: 0, alpha: 1.0)
      case .brown:
        return UIColor(red: 160/255.0, green: 82/255.0, blue: 45/255.0, alpha: 1.0)
      case .orange:
        return UIColor(red: 1, green: 102/255.0, blue: 0, alpha: 1.0)
      case .yellow:
        return .yellow
     
      }
    }
}

