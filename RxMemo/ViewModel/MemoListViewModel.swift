//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/09.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
