//
// Created by sergdort on 03/02/2017.
// Copyright (c) 2017 sergdort. All rights reserved.
//

import RxSwift

public final class ErrorTracker: ObservableConvertibleType {
    private let _subject = PublishSubject<Error>()

    fileprivate func trackError<O: ObservableConvertibleType>(from source: O) -> Observable<O.Element> {
        return source.asObservable().do(onError: onError)
    }

    public func asObservable() -> Observable<Error> {
        return _subject.asObservable()
    }

    private func onError(_ error: Error) {
        _subject.onNext(error)
    }

    deinit {
        _subject.onCompleted()
    }
}

extension ObservableConvertibleType {
    public func trackError(_ errorTracker: ErrorTracker) -> Observable<Element> {
        return errorTracker.trackError(from: self)
    }
}


public final class FailureTracker: ObservableConvertibleType {
    private let _subject = PublishSubject<Error>()
    
    fileprivate func trackFailure<O: ObservableConvertibleType,T,E>(from source: O) -> Observable<O.Element> where O.Element == Swift.Result<T,E>, E: Error {
        return source.asObservable().doFailure(onError)
    }
    
    public func asObservable() -> Observable<Error> {
        return _subject.asObservable()
    }
    
    private func onError(_ error: Error) {
        _subject.onNext(error)
    }
    
    deinit {
        _subject.onCompleted()
    }
}

extension ObservableConvertibleType {
    public func trackFailure<T,E>(_ failureTracker: FailureTracker) -> Observable<Element> where Element == Swift.Result<T,E>, E: Error {
        return failureTracker.trackFailure(from: self)
    }
}
