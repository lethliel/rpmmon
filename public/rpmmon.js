$(document).ready(function()
{
	reload_rpm_overview();
	$('#reset').click(function() {
		//Start init process
                $('#rpm_overview').load('init');
        });

});

function reload_rpm_overview () {
	$('#rpm_overview').load('view', function () {
		$(this).unwrap();
		//Call self every 5 seconds
		timeout  = setTimeout(reload_rpm_overview, 5000);
	});
}
