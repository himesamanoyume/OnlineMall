function changeInfoContainerPosition(){
    if(document.body.clientWidth<=975){
        $('.info-container').css('position','inherit');
    }else{
        $('.info-container').css('position','sticky');
    }
}