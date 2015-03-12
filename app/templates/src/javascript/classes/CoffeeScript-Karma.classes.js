(function() {
  var root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;


  /*
    First example class to get you started.
  
    Test file in test/coffee/index.test.coffee
   */

  root.ITEM = (function() {
    function ITEM(name) {
      this.name = name;
      this.inventory = 0;
    }

    ITEM.prototype.add = function() {
      var fn, i, len, number, parent;
      parent = this;
      fn = function(number) {
        return parent.inventory += number;
      };
      for (i = 0, len = arguments.length; i < len; i++) {
        number = arguments[i];
        fn(number);
      }
      return this.inventory;
    };

    ITEM.prototype.remove = function() {
      var fn, i, len, number, parent;
      parent = this;
      fn = function(number) {
        return parent.inventory -= number;
      };
      for (i = 0, len = arguments.length; i < len; i++) {
        number = arguments[i];
        fn(number);
      }
      return this.inventory;
    };

    return ITEM;

  })();

}).call(this);
