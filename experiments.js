var scoreMultiplier = 2;
var highestScores = [316, 320, 312, 370, 337, 318, 314];

var scoreMultiplier = 3;

function doubleScores(scores) {

  // Reject non-list type inputs
  if (Array.isArray(scores) === false) {
    throw new Error("Input must be of type array");
  }

  var newScore = [];

    for (var i = 0; i< scores.length; i++) {
      //Reject arrays that contain values that are not numbers
      if (typeof scores[i] !== "number") {
        throw new Error("Input array must contain numbers only");
      } else {
        newScore[i] = scores[i] * scoreMultiplier;
      }
    }

    return newScore;
}