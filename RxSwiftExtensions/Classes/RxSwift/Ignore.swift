//
//  ignore.swift
//  RxSwiftExt
//
//  Created by Florent Pillet on 10/04/16.
//  Copyright © 2016 RxSwift Community. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType where E: Equatable {

	public func ignore(_ valuesToIgnore: E ...) -> Observable<E> {
        return self.asObservable().filter { !valuesToIgnore.contains($0) }
    }

	public func ignore<S: Sequence>(_ valuesToIgnore: S) -> Observable<E> where S.Iterator.Element == E {
		return self.asObservable().filter { !valuesToIgnore.contains($0) }
	}
}

extension ObservableType {
    
    /**
     Ignores the elements of an observable sequence based on a predicate.
     
     - seealso: [filter operator on reactivex.io](http://reactivex.io/documentation/operators/filter.html)
     - seealso: [ignoreElements operator on reactivex.io](http://reactivex.io/documentation/operators/ignoreelements.html)
     
     - parameter predicate: A function to test each source element for a condition.
     - returns: An observable sequence that contains elements from the input sequence except those that satisfy the condition.
     */
    public func ignoreWhen(_ predicate: @escaping (E) throws -> Bool) -> Observable<E> {
        return self.asObservable().filter { try !predicate($0) }
    }
}
