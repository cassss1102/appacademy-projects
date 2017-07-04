function madLib(verb, adjective, noun){
  return `we shall ${verb.toUpperCase()} the ${adjective.toUpperCase() + noun.toUpperCase()}`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// Define a function fizzBuzz(array) that takes an array and
// returns a new array of every number in the array that is divisible
// by either 3 or 5, but not both.
function fizzBuzz(array) {
  var result = [];
  var i = 0;

  while (i < array.length) {
    if (array[i] % 3 === 0 ^ array[i] % 5 === 0) {
      result.push(array[i]);
    }

    i ++;
  }

  return result;
}

// function isPrime(number) {
//   if (number < 2) {return false; }
//
//   for (var i = 2; i < number; i ++) {
//     number % i === 0 ? false : true;
//   }
// }
function isPrime(number) {
  if (number < 2) {return false; }

  for (var i = 2; i < number; i ++) {
    if (number % i === 0) {return false};
  }

  return true
}


function sumOfNPrimes(n) {
  let sum = 0;
  let num = 2;
  let count = 0;
  while ( count < n ) {
    if (isPrime(num)) {
      sum += num;
      count ++;
    }

    num ++;
  }

  return sum;
}

function titleize(names, cb) {
  let titleized = names.map(cb(el));
}

function printCallback(name) {
  return `Mx. ${name} Jingleheimer Schmidt`
}
