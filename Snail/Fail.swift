//  Copyright © 2016 Compass. All rights reserved.

import Foundation
import Dispatch

public class Fail<T>: Observable<T> {
    private let error: Error

    public init(_ error: Error) {
        self.error = error
    }

    public override func subscribe(queue: DispatchQueue? = nil, onNext: ((T) -> Void)?, onError: ((Error) -> Void)?, onDone: (() -> Void)?) {
        let handler = createHandler(onNext: onNext, onError: onError, onDone: onDone)
        notify(subscriber: Subscriber(queue: queue, handler: handler), event: .error(error))
    }
}
