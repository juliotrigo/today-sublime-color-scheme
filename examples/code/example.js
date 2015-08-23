// JavaScrip example

Function.method('new', function ( ) {
    var that = Object.create(this.prototype);
    var other = this.apply(that, arguments);

    return (typeof other === 'object' && other) || that;
});

var Mammal = function (name) {
    this.name = name;
};

Mammal.prototype.get_name = function ( ) {
    return this.name;
};

var myMammal = new Mammal('Herb the Mammal');
var name = myMammal.get_name( );  // 'Herb the Mammal'

var Cat = function (name) {
    this.name = name;
    this.saying = 'meow';
};

// Replace Cat.prototype with a new instance of Mammal
Cat.prototype = new Mammal( );

Function.method('inherits', function (Parent) {
    this.prototype = new Parent( );
    return this;
});
