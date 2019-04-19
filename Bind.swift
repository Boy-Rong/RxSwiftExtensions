//
//  Bind.swift
//  Pods-RxSwiftExtensions_Example
//
//  Created by 荣恒 on 2019/4/19.
//

import RxSwift

extension ObservableType {
    
    public func bind<O: ObserverType>(to observers: [O]) -> Disposable where O.E == E {
        let shared = self.share()
        let disposables = observers.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind<O: ObserverType>(to observers: [O]) -> Disposable where O.E == E? {
        let shared = self.share()
        let disposables = observers.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
}
