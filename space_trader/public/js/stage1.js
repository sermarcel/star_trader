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




$ships.on('click',function(){
var $your_ship=this

console.log($your_ship)
console.log($cssShip.value)
console.log($nickForm)


$choice.text('Wpisz swój nick')
$ships.hide()
$nickForm.show()

})
})