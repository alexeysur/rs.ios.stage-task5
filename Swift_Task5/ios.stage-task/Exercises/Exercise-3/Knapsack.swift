import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        var foodAndDrinkArray: [[Int]] = []
        var bestDistanse = 0
        
        guard maxWeight > 0 && maxWeight <= 2500 else {
            return 0
        }
        
        if drinks.count < 1 || drinks.count > 100 { return 0 }
        if foods.count < 1 || foods.count > 100 { return 0 }
        
        for food in foods {
            for drink in drinks {
                if (food.weight + drink.weight) <= maxWeight {
                    var tmpFoodAndDrink: [Int] = []
                    tmpFoodAndDrink.append(food.value)
                    
                    tmpFoodAndDrink.append(drink.value)
                    foodAndDrinkArray.append(tmpFoodAndDrink)
                }
            }
        }
        var tmpArray: [Int] = []
        
        for i in foodAndDrinkArray {
            i.forEach( {_ in
                if let minValue = i.min() {
                    tmpArray.append(minValue)
                }
            })
        }
        
        bestDistanse = tmpArray.max() ?? 0
        
        return bestDistanse
    }
    
}
