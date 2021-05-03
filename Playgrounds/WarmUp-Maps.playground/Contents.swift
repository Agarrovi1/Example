import UIKit

var str = "Hello, playground"
//1. “MP”: num of Matches Played,
//> 2. “W”: num of Wins,
//> 3. “D”: num of Draws,
//> 4. “L”: num of Losses,
//> 5. “GF”: num of Goals Scored (“goals for”),
//> 6. “GA”: num of Goals Allowed,
//> 7. “GD”: Goal differential (goals scored - goals allowed),
//> 8. “Pts”:total points.

func generateRowInStandings(goalsScoredinEachGame goalsScored: [Int],  goalsAllowedinEachGame goalsAllowed: [Int]) -> (Int, Int, Int, Int, Int, Int, Int, Int) {
    let mp = goalsScored.count
    var wins = 0
    var draws = 0
    var losses = 0
    var gf = 0
    var ga = 0
    var gd = 0
    var pts = 0
    for index in 0...(goalsScored.count - 1) {
        gf += goalsScored[index]
        ga += goalsAllowed[index]
        if goalsScored[index] > goalsAllowed[index] {
            wins += 1
            pts += 3
        } else if goalsScored[index] == goalsAllowed[index] {
            draws += 1
            pts += 1
        } else {
            losses += 1
        }
        
    }
    gd = gf - ga
    return (mp, wins, draws, losses, gf, ga, gd, pts)
}

let score = generateRowInStandings(goalsScoredinEachGame: [1,3,5], goalsAllowedinEachGame: [5,3,1])
print(score)

func generateEntireStandings(goalsScoredforEachTeamInEachGame goalsScored: [[Int]], goalsAllowedforEachTeamInEachGame goalsAllowed: [[Int]]) -> [(Int, Int, Int, Int, Int, Int, Int, Int)] {
    var answer = [(Int, Int, Int, Int, Int, Int, Int, Int)]()
    for index in 0...(goalsScored.count - 1) {
        let score = generateRowInStandings(goalsScoredinEachGame: goalsScored[index], goalsAllowedinEachGame: goalsAllowed[index])
        answer.append(score)
    }
    return answer.sorted(by: {(a,b) in a.7 > b.7})
}
