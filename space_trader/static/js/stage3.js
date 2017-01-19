$(document).ready(function(event){


var $quantity=$('.prod')
console.log($quantity.length)
var $butt=$('.button')
$butt.on('click',function(){

$quantity.each(function(i,val){
console.log($(this).val())
})
})
})