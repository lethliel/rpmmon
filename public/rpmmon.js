$(document).ready(function()
{
	var timeout = setTimeout(reload_rpm_overview, 10000);

});

function reload_rpm_overview () {
	$('#rpm_overview').load('view', function () {
		$(this).unwrap();
		timeout  = setTimeout(reload_rpm_overview, 10000);
	});
}
