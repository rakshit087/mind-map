dbuttons=document.querySelectorAll("button");

for (i of dbuttons){
    i.addEventListener("click", handleClick);
}

function handleClick(){
    
    var buttonType = this.innerHTML;
    switch (buttonType){

        case "w":
        var audioFile = new Audio("sounds/crash.mp3");
        audioFile.play();

        case "a":
        var audioFile = new Audio("sounds/kick-bass.mp3");
        audioFile.play();

        case "s":
        var audioFile = new Audio("sounds/snare.mp3");
        audioFile.play();

        case "d":
        var audioFile = new Audio("sounds/tom-1.mp3");
        audioFile.play();

        case "j":
        var audioFile = new Audio("sounds/tom-2.mp3");
        audioFile.play();

        case "k":
        var audioFile = new Audio("sounds/tom-3.mp3");
        audioFile.play();

        case "l":
        var audioFile = new Audio("sounds/tom-4.mp3");
        audioFile.play();

        
    }
}
    // temp function
    document.addEventListener("keypress", function(event){
        switch (event.key){

            case "w":
            var audioFile = new Audio("sounds/crash.mp3");
            audioFile.play();
    
            case "a":
            var audioFile = new Audio("sounds/kick-bass.mp3");
            audioFile.play();
    
            case "s":
            var audioFile = new Audio("sounds/snare.mp3");
            audioFile.play();
    
            case "d":
            var audioFile = new Audio("sounds/tom-1.mp3");
            audioFile.play();
    
            case "j":
            var audioFile = new Audio("sounds/tom-2.mp3");
            audioFile.play();
    
            case "k":
            var audioFile = new Audio("sounds/tom-3.mp3");
            audioFile.play();
    
            case "l":
            var audioFile = new Audio("sounds/tom-4.mp3");
            audioFile.play();
        }
    });