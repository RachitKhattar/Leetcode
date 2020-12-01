import UIKit

class RecentCounter {
    
    static let timeRange = 3000
    
    var requestsAt = [Int]()
    
    var lastMinIndex = 0

    init() {
    }
    
    func ping(_ t: Int) -> Int {
        var index: Int? = nil
        for i in lastMinIndex..<requestsAt.count {
            if requestsAt[i] >= (t - RecentCounter.timeRange) {
                index = i
                break
            }
        }
        if let index = index {
            requestsAt.append(t)
            return (requestsAt.count - 1 -  index) + 1
        } else {
            requestsAt.append(t)
            lastMinIndex = requestsAt.count - 1
            return 1
        }
    }
}

let obj = RecentCounter()

obj.ping(642);     // requests = [1], range is [-2999,1], return 1

obj.ping(1849);   // requests = [1, 100], range is [-2900,100], return 2

obj.ping(4921);  // requests = [1, 100, 3001], range is [1,3001], return 3

obj.ping(5936);  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3

obj.ping(5957)

