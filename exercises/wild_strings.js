// given a string with 0s, 1s and ?s, where ? can be 1
// or 0, find all possible combinations for this string

//ie 10??1
// --> 10001
// --> 10011
// --> 10101
// --> 10111

var wildStrings = function(str) {
  var final = [];
  if (str.length < 2) {
    if (str[0] === "?") {
      return ["0", "1"];
    } else {
      return [str];
    }
  } else {
    if (str[0] === "?") { // needs to be cleaned up!
      var extra = wildStrings(str.slice(1)).map(function(chars){
        return "0" + chars;
      });
      var temp = wildStrings(str.slice(1)).map(function(chars){
        return "1" + chars;
      });
      extra = extra.concat(temp);
    } else {
      extra = wildStrings(str.slice(1)).map(function(chars){
        return str[0] + chars;
      });
    }
    return extra;
  }
};
