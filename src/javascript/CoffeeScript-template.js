
/*
  First example class to get you started.

  Test file in test/coffee/main.test.coff
 */

(function() {
  var CALCULATOR;

  CALCULATOR = (function() {
    function CALCULATOR() {
      this.sum = 0;
    }

    CALCULATOR.prototype.add = function() {
      var fn, i, len, number, parent;
      parent = this;
      fn = function(number) {
        return parent.sum += number;
      };
      for (i = 0, len = arguments.length; i < len; i++) {
        number = arguments[i];
        fn(number);
      }
      return this.sum;
    };

    return CALCULATOR;

  })();

}).call(this);
