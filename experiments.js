var scoreMultiplier = 2;
var highestScores = [316, 320, 312, 370, 337, 318, 314];

var scoreMultiplier = 3;

function doubleScores(scores) {
    for (var i = 0; i< scores.length; i++) {
        scores[i] = scores[i] * scoreMultiplier;
    }

    return scores;
}