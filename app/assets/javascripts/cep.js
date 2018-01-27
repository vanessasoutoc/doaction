window.onload = getDataCep();

$(document).ready(function(){
    getDataCep();
});

/*$(document).on('turbolinks:load',function(){
    console.log('oi');
});*/

function getDataCep(){
    
    console.log('getDataCep');
    $.get(' viacep.com.br/ws/38060510/json/', function(data){
        console.log(data);
    })
}