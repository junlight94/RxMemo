//
//  Memo.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/08.
//

import Foundation
import RxDataSources
import RxCoreData
import CoreData

// Equatable 프로토콜 채용
struct Memo: Equatable, IdentifiableType {
    var content: String
    var insertDate: Date
    var identity: String
    
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        //insertDate의 timeInterval 값을 문자열로 바꿔서 저장
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    // update된 내용으로 새로운 메모 인스턴스를 만들 때 사용
    init(original: Memo, updateContent: String) {
        self = original
        self.content = updateContent
    }
}

extension Memo: Persistable {
    static var entityName: String {
        return "Memo"
    }
    
    static var primaryAttributeName: String {
        return "identity"
    }
    
    init(entity: NSManagedObject) {
        content = entity.value(forKey: "content") as! String
        insertDate = entity.value(forKey: "insertDate") as! Date
        identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    func update(_ entity: NSManagedObject) {
        entity.setValue(content, forKey: "content")
        entity.setValue(insertDate, forKey: "insertDate")
        entity.setValue("\(insertDate.timeIntervalSinceReferenceDate)", forKey: "identity")
        
        do {
            try entity.managedObjectContext?.save()
        } catch {
            print(error)
        }
    }
}
