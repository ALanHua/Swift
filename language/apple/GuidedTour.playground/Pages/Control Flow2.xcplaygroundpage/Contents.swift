//: [Previous](@previous)

import Foundation

let finalSquare = 25
var board = [Int](repeatElement(0, count: finalSquare+1))
// 梯子
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
// 蛇
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square];
        print(square)
    }
}
print("Game over!")