$(document).ready(function()
{
	$('#start').click(function() {
		reload_rpm_overview();
	});
	$('#reset').click(function() {
                $('#rpm_overview').load('init');
        });

});

function reload_rpm_overview () {
	$('#rpm_overview').load('view', function () {
		$(this).unwrap();
		timeout  = setTimeout(reload_rpm_overview, 10000);
	});
}
