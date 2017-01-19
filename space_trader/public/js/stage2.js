

$(document).ready(function(event){



//$(window).load(function() {

var $planety=$('.planety')
/*

    $("#planeta1").css("left", $("#planeta1").position().right).circulate({
            sizeAdjustment: 160,
            speed: 3500,
            width: 800,
            height: 150,
            loop: true,
            zIndexValues: [1, 5, 00, 100]
    });

    $("#planeta2").css("left", $("#planeta2").position().right).circulate({
            sizeAdjustment: 160,
            speed: 4000,
            width: 800,
            height: 150,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]
    });

    $("#planeta3").css("left", $("#planeta3").position().right).circulate({
            sizeAdjustment: 160,
            speed: 3000,
            width: 800,
            height: 150,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]
    });

    $("#planeta4").css("left", $("#planeta4").position().right).circulate({
            sizeAdjustment: 160,
            speed: 3000,
            width: 800,
            height: 150,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]
    });
*/
 
 function startBall1() {
        $("#planeta1").circulate({
            speed: 2500,
            height: 40,
            width: 70,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }

 function startBall2() {
        $("#planeta2").circulate({
            speed: 1500,
            height: 30,
            width: 80,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }


 function startBall3() {
        $("#planeta3").circulate({
    
            speed: 1000,
            height: 30,
            width: 40,
            sizeAdjustment: 80,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]

    });
 }
      function startBall4() {
        $("#planeta4").circulate({
            speed: 2000,
            height: 20,
            width: 100,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }

startBall1()
startBall2()
startBall3()
startBall4()



$planety.on('click',function(){

//$planety.circulate("Stop");
console.log("clik")

//});
})

$planety.on('mouseleave',function(){
//startBallOne()
})
})

