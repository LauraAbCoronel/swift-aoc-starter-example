import Algorithms
import Foundation

struct Day04: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [ScratchCards] {
	  var scratchCards: [ScratchCards] = []
	  let reg = #/Card\s*(\d+):\s*(.*) \|\s*(.*)/#
	  for row in data.split(separator: "\n") {
		  var scratchCard: ScratchCards
		  if let result = try? reg.firstMatch(in: row) {
			  scratchCard = ScratchCards(id: Int(result.1) ?? 0)
			  let winStr = result.2.split(separator: " ").map {
				  Int($0) ?? 0
			  }
			  scratchCard.winningNumbers = winStr
			  let numStr = result.3.split(separator: " ").map {
				  Int($0) ?? 0
			  }
			  scratchCard.yourNumbers = numStr
			  scratchCards.append(scratchCard)
		  }
	  }
	  return scratchCards
	  
  }

  // Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var totalWinnings = 0
		for entity in entities {
			var matchCount = 0
//			var match: [Int] = []
			for winNumber in entity.winningNumbers {
				// check if our number contains a winning number
				if entity.yourNumbers.contains(winNumber) {
					// if so add 1 to the matchCount
					matchCount += 1
//					match.append(winNumber)
				}
			}
			var points: NSNumber = 0
			// check if any matches were found
			if matchCount > 0 {
				// Points double for each number matching the winning number (ex 5 matches = 16 points)
				points = NSDecimalNumber(decimal: pow(2, matchCount - 1))
			}
//			print("id: \(entity.id) winning = \(winning), match = \(match)")
			totalWinnings += Int(truncating: points)
		}
		return totalWinnings
	}


  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
	  var totalCards = 0
	  var entities = self.entities
	  for (index, entity) in entities.enumerated() {
		  var matchCount = 0
		  for winningNumber in entity.winningNumbers {
			  if entity.yourNumbers.contains(winningNumber) {
				  matchCount += 1
			  }
		  }
		  if matchCount > 0 {
			  for number in 1...matchCount {
				  if index + number < 187 {
					  entities[index + number].quantity += entities[index].quantity
				  }
			  }
		  }
		  totalCards += entities[index].quantity
	  }
	  return totalCards
  }
}

struct ScratchCards {
	let id: Int
	var quantity: Int = 1
	var winningNumbers: [Int] = []
	var yourNumbers: [Int] = []
}
