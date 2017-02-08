$(document).ready(function(event){
var $ships = $('.statek')
var $ramka = $('#ramka')
var $nickForm=$('#nick')
var $cssShip=$("#cssShip")
var $choice=$('#choice')


$('.statek').click(function(){

var $your_discription=$(this).next('.opis')

$(this).toggle('slow')
$your_discription.toggle('slow')

})

$('.opis').click(function(){
var $your_ship=$(this).prev('.statek')
$your_ship.toggle('slow')
$(this).toggle('slow')



});

$('.statek').dblclick(function(){

var $your_ship=this
console.log($cssShip)

console.log($your_ship)


console.log($($your_ship).data("id"))
var $newShip=$($your_ship).data("id")
// save player choice in #cssShip element and upload to form
$("#cssShip option:checked" ).val($newShip)
console.log($("#cssShip option:checked").val())
$('.statek').hide('fast')


//console.log($nickForm)


$choice.text('Wpisz swój nick:')
$nickForm.show()

})
})