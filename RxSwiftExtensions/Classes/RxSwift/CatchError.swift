//
//  CatchError.swift
//  RxSwiftX
//
//  Created by Pircate on 2018/6/4.
//  Copyright © 2018年 Pircate. All rights reserved.
//

import RxSwift

public extension ObservableConvertibleType {
    
    func catchErrorJustReturn(closure: @escaping @autoclosure () throws -> E) -> Observable<E> {
        return asObservable().catchError { _ in
            return Observable.just(try closure())
        }
    }
    
    func catchErrorJustComplete() -> Observable<E> {
        return asObservable().catchError { _ in
            Observable.empty()
        }
    }
}
