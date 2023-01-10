//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/09.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
    
    func makeCreateAction() -> CocoaAction {
        return CocoaAction { _ in
            return self.storage.create(content: "")
                .flatMap { memo -> Observable<Void> in
                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
                    
                    let composeScene = Scene.compose(composeViewModel)
                    
                    return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true)
                        .asObservable()
                        .map { _ in }
                }
        }
    }
    
    // 메서드
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action { input in
            return self.storage.update(memo: memo, content: input).map{ _ in }
        }
    }
    
    func performCancel(memo: Memo) -> CocoaAction {
        return Action {
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
    
    // 속성
    lazy var detailAction: Action<Memo, Void> = {
        
        return Action{ memo in
            
            let detailViewModel = MemoDetailViewModel(memo: memo, title: "메모 보기", sceneCoordinaotr: self.sceneCoordinator, storage: self.storage)
            
            let detailScene = Scene.detail(detailViewModel)
            
            return self.sceneCoordinator.transition(to: detailScene, using: .push, animated: true)
                .asObservable()
                .map {_ in}
        }
        
    }()
    
    lazy var deleteAction: Action<Memo, Void> = {
        return Action { memo in
            return self.storage.delete(memo: memo)
                .map{ _ in }
        }
    }()
    

}
