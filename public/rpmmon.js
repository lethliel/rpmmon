$(document).ready(function()
{
	$('#start').click(function() {
		reload_rpm_overview();
	});
	$('#reset').click(function() {
		//Start init process
                $('#rpm_overview').load('init');
        });

});

function reload_rpm_overview () {
	$('#rpm_overview').load('view', function () {
		$(this).unwrap();
		//Call self every 10 seconds
		timeout  = setTimeout(reload_rpm_overview, 10000);
	});
}
