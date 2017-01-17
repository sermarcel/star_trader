

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

    $("#planeta5").css("left", $("#planeta5").position().right).circulate({
            sizeAdjustment: 160,
    
            speed: 3000,
            width: 800,
            height: 150,
            loop: true,
            //zIndexValues: [1, 5, 500, 100]
    });
*/
      function startBallOne() {
        $("#planeta5").circulate({
            speed: 1000,
            height: 5,
            width: 15,
            sizeAdjustment: 90,
            loop: true,
            zIndexValues: [1, 100, 500, 100]
        });
    }


startBallOne()


$planety.on('click',function(){

//$planety.circulate("Stop");
console.log("clik")

//});
})

$planety.on('mouseleave',function(){
//startBallOne()
})
})

