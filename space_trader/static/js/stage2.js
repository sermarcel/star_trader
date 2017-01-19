

$(document).ready(function(event){



//$(window).load(function() {

var $planety=$('.planety')

 
 function startBall1() {
        $("#Solaris").circulate({
            speed: 2500,
            height: 40,
            width: 70,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }

 function startBall2() {
        $("#Krypton").circulate({
            speed: 1500,
            height: 30,
            width: 80,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }


 function startBall3() {
        $("#Genezis").circulate({
    
            speed: 1000,
            height: 30,
            width: 40,
            sizeAdjustment: 80,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]

    });
 }
      function startBall4() {
        $("#Pandora").circulate({
            speed: 2000,
            height: 20,
            width: 100,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }
/*
startBall1()
startBall2()
startBall3()
startBall4()
*/


$planety.on('click',function(){


var $destinationPlanet =this
$destinationPlanet=$($destinationPlanet).attr('id')
var $planetId=$(this).data("id")
var link='stage3/'+$destinationPlanet
console.log(link)
$('.button').val('Lecę na ' + $destinationPlanet +' !!!')
$('a').attr('href',link)

//});
})


})

