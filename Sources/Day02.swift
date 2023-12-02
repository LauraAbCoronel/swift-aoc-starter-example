import Algorithms

struct Day02: AdventDay {
	// Save your data in a corresponding text file in the `Data` directory.
	var data: String
	
	// Splits input data into its component parts and convert from string.
	var entities: [Game] {
		var games: [Game] = []
		for row in data.split(separator: "\n") {
			var game: Game
			let idSearch = #/Game (\d+): /#
			
			if let result = try? idSearch.prefixMatch(in: row) {
				game = Game(id: Int(result.1) ?? 0)
				let sets = String(row.replacing(idSearch, with: "")).split(separator: ";")
				for set in sets {
					// find max red number
					if let redResult = try? #/(\d+) red/#.firstMatch(in: set) {
						let redResultInt = Int(redResult.1) ?? 0
						if game.red < redResultInt {
							game.red = redResultInt
						}
					}
					// find max blue number
					if let blueResult = try? #/(\d+) blue/#.firstMatch(in: set) {
						let blueResultInt = Int(blueResult.1) ?? 0
						if game.blue < blueResultInt {
							game.blue = blueResultInt
						}
					}
					// find max green number
					if let greenResult = try? #/(\d+) green/#.firstMatch(in: set) {
						let greenResultInt = Int(greenResult.1) ?? 0
						if game.green < greenResultInt {
							game.green = greenResultInt
						}
					}
					
				}
				games.append(game)
			}
		}
		return games
	}
	
	// Replace this with your solution for the first part of the day's challenge.
	func part1() -> Any {
		var sum = 0
		for entity in entities {
			if entity.red <= 12 && entity.blue <= 14 && entity.green <= 13 {
				sum += entity.id
			}
		}
		// Calculate the sum of the first set of input data
		return sum
		
	}
	
	// Replace this with your solution for the second part of the day's challenge.
	func part2() -> Any {
		var sum = 0
		// Sum the maximum entries in each set of data
		for entity in entities {
			sum += entity.red * entity.blue * entity.green
		}
		return sum
	}
}

struct Game {
	let id: Int
	var red: Int = 0
	var blue: Int = 0
	var green: Int = 0
}

