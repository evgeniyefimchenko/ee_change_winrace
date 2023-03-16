function hide_prompt() {
	var test = document.querySelector(".bp-nav");
	setTimeout(function() {                
		var div_box = document.getElementById("bottom_panel_div_box");
		if(div_box) {
			div_box.classList.add("removing");
		}
	}, 500);
	setTimeout(function() {
		var div_box = document.getElementById("bottom_panel_div_box");
		if(div_box) {
			var test = document.querySelector(".bp-nav");
			test.removeChild(div_box);
		}
		document.getElementById("body_prompt_container").style.backgroundColor = "#ffffff00";
		document.getElementById("body_prompt_container").remove();
	}, 1000);
}

function show_prompt() {
	var test = document.querySelector(".bp-nav");
	var body_prompt_container = document.createElement("div");
	body_prompt_container.setAttribute("id", "body_prompt_container");
	body_prompt_container.style.transition = "background-color 1s";
	
	document.getElementsByTagName("body")[0].appendChild(body_prompt_container);

	setTimeout(function() {
		body_prompt_container.style.zIndex = "1100";
		body_prompt_container.style.backgroundColor = "#000000d0"
	}, 3000);        
	
	setTimeout(function() {   
		if (!document.getElementById("bottom_panel_div_box")) {        
			var div_box = document.createElement("div");
			div_box.setAttribute("id", "bottom_panel_div_box");
			div_box.setAttribute("class", "bottom_panel_div_box");

			var span_box = document.createElement("span");
			span_box.setAttribute("id", "bottom_panel_span_exit");
				
			span_box.innerText = "×";
			span_box.addEventListener("click", function(e) {
				hide_prompt();
			});

			var p_box = document.createElement("p");
			p_box.innerText = "Переключайтесь между витриной и панелью продавца, добавляя или редактируя товары для получения наиболее приемлемого вида карточки.";
			p_box.innerHTML = p_box.innerHTML.replace("витриной", "<span style='color: #000; font-weight: 700;'>витриной</span>");
			p_box.innerHTML = p_box.innerHTML.replace("панелью продавца", "<span style='color: #000; font-weight: 700;'>панелью продавца</span>");
						
			var div_box2 = document.createElement("div");
			div_box2.setAttribute("id", "bottom_panel_triangle_div");

			div_box.appendChild(span_box);
			div_box.appendChild(p_box);
			div_box.appendChild(div_box2);

			test.appendChild(div_box);
		}
	}, 3500);
}
 
window.onload = function() {
	if (!localStorage.getItem('hasBeenShownPrompt')) {
		show_prompt();
		setTimeout(function() {
			hide_prompt();
		}, 6000);		
		localStorage.setItem('hasBeenShownPrompt', true);
	}
};
