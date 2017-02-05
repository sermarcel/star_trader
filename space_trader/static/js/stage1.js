$(document).ready(function(event){
var $ships = $('.statek')
var $ramka = $('#ramka')
var $nickForm=$('#nick')
var $cssShip=$("#cssShip")
var $choice=$('#choice')


$('.statek').click(function(){

var $your_discription=$(this).next('.opis')

$(this).toggle('fast')
$your_discription.toggle('fast')

})

$('.opis').click(function(){
var $your_ship=$(this).prev('.statek')
$your_ship.toggle('fast')
$(this).toggle('fast')



});

$('.opis, .statek').dblclick(function(){

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