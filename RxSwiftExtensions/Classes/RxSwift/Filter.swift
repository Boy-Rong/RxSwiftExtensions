//
//  filter.swift
//  RHSwiftExtensions
//
//  Created by 荣恒 on 2019/4/4.
//

import Foundation
import RxSwift


public extension ObservableType {
    
    /// 过滤掉nil
    func filterNil<T>() -> Observable<T> where E == Optional<T> {
        return filter({ $0 != nil }).map({ $0! })
    }
    
}

public extension ObservableType where E : Equatable {
    /// 留下给定的值
    func stay(_ values : Self.E...) -> Observable<Self.E> {
        return filter({ values.contains($0) })
    }
}
