//: [Previous](@previous)

import Foundation

class Solution {
    
    func insert(asteroid: Int, stableAsteroids: inout [Int]) {
        if let lastStable = stableAsteroids.last {
            if (lastStable < 0 && asteroid < 0) || (lastStable > 0 && asteroid > 0) {
                stableAsteroids.append(asteroid)
            } else {
                if lastStable > 0 && asteroid < 0 {
                    if abs(lastStable) > abs(asteroid) {
                        // do nothing
                    } else if abs(lastStable) == abs(asteroid) {
                        stableAsteroids.removeLast()
                    } else {
                        stableAsteroids.removeLast()
                        insert(asteroid: asteroid, stableAsteroids: &stableAsteroids)
                    }
                } else {
                    stableAsteroids.append(asteroid)
                }
            }
        } else {
            stableAsteroids.append(asteroid)
        }
    }
    
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stableAsteroids = [Int]()
        
        for i in 0..<asteroids.count {
            insert(asteroid: asteroids[i], stableAsteroids: &stableAsteroids)
        }
        
        return stableAsteroids
        
    }
}

Solution().asteroidCollision([5,10,-5])
Solution().asteroidCollision([8,-8])
Solution().asteroidCollision([10,2,-5])
Solution().asteroidCollision([-2,-1,1,2])
Solution().asteroidCollision([])


//: [Next](@next)
