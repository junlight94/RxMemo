//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/09.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissin
    case cannotPop
    case unknown
}


