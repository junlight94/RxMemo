//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/09.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
