(function() {
  var getName, restock, root, sell, stock;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;


  /*
    Create stock of apples.
    Use the item class created in example.class.coffee
   */

  stock = new root.ITEM('apples');

  getName = function() {
    return this.stock.name;
  };

  restock = function(amount) {
    return this.stock.add(amount);
  };

  sell = function(amount) {
    return this.stock.remove(amount);
  };

}).call(this);
