$(document).ready(function(event){
var $ships = $('.statek')
var $ramka = $('#ramka')
var $nickForm=$('#nick')
var $cssShip=$("#cssShip")
//console.log($ramka.children().length)
/*
for (var i=0; i<$ramka.children().length;i++) {
$ramka.children(i).hide()
};
*/
var $choice=$('#choice')
$ships.mouseenter(function(){
var $your_ship=this
$($your_ship).next('.opis').fadeIn('slow')
})
.mouseleave(function(){
var $your_ship=this

$($your_ship).next('.opis').fadeOut('slow')
});




$ships.on('click',function(){

var $your_ship=this
console.log($cssShip)

console.log($your_ship)


console.log($($your_ship).data("id"))
var $newShip=$($your_ship).data("id")

$("#cssShip option:checked" ).val($newShip)
console.log($("#cssShip option:checked").val())


//console.log($nickForm)


$choice.text('Wpisz swój nick:')
$ships.hide()
$nickForm.show()

})
})