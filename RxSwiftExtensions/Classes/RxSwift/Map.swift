//
//  map.swift
//  RHSwiftExtensions
//
//  Created by 荣恒 on 2019/4/4.
//

import Foundation
import RxSwift


public extension ObservableType {
    
    func mapVoid() -> Observable<Void> {
        return map({ _ in () })
    }
    
    func mapTo<T>(_ value : T) -> Observable<T> {
        return map({ _ in value })
    }
    
    /// map 成功后的值（过滤失败），并处理 Failure事件
    func mapSuccess<T,E>(failure : ((Error) -> Void)? = nil) -> Observable<T> where Self.E == Swift.Result<T,E>, E : Error {
        return `do`(onNext: { result in
            switch result {
            case .success: break
            case let .failure(error): failure?(error)
            }
        }).map({ try $0.get() })
    }
    
}

// MARK: - 序列 Collection Map
public extension ObservableType where E: Collection {
    
    /// 将序列中的数组map
    func mapMany<T>(_ transform: @escaping (Self.E.Element) -> T) -> Observable<[T]> {
        return self.map { collection -> [T] in
            collection.map(transform)
        }
    }
    
}
