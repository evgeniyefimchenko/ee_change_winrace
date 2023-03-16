$(document).ready(function() {
	var scroll_height = 100;
	$('body').append('<img src="https://upload.wikimedia.org/wikipedia/commons/c/c0/Eo_circle_green_arrow-up.svg" id="ee_scroll_arrow" class="ee_arrow_class"/>');
	if ($(window).scrollTop() > scroll_height)  {
		$('#ee_scroll_arrow').show(500);
	}
	$(window).scroll(function () {
	if ($(window).scrollTop() > scroll_height)  {
		$('#ee_scroll_arrow').show(500);
	} else {
		$('#ee_scroll_arrow').hide(500);
	}
	});
	$(document).on('click', '#ee_scroll_arrow', function() {
	$("html, body").stop().animate( { scrollTop: 0 }, {
		duration: 300, easing: "linear"
	});
		return false;
	});
	let today = new Date();
	$('#current_year').text(today.getFullYear());

	var div11 = $("#dropdown_781");
	var div1 = $(".top-menu-grid-vetrtical");
	var div2 = $("#sw_dropdown_781");
	var div4 = $("#sw_dropdown_76");
	var div33 = $("#dropdown_76");
	var div3 = $(".ut2-top-my-account");
	var div6 = $("#sw_dropdown_783");
	var div55 = $("#dropdown_783");
	var div5 = $(".ut2-top-cart-content");
	$(document).mouseup(function(e) {
		if (!div1.is(e.target) && div1.has(e.target).length === 0) {
			div11.hide();			
			div2.removeClass('open');
		}
		if (!div3.is(e.target) && div3.has(e.target).length === 0) {
			div33.hide();			
			div4.removeClass('open');
		}
		if (!div5.is(e.target) && div5.has(e.target).length === 0) {
			div55.hide();
			div6.removeClass('open');
		}
	});
	
});
