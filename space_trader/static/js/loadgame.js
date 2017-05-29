$(document).ready(function(){

$("#loader").find('tr').on('click',function(){

var $player = this.children[1]
//var $player = this

$player = $($player).html()
console.log($player)
$('#load').val('WCZYTAJ GRĘ DLA ' + $player +' !!!');
});

});
