$(".collapse .block-white.columns").click(function(ev){
	if($(this).hasClass("show")){
		$(this).removeClass("show");
	}else{
		$(this).addClass("show");	
	}
});