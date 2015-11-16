package rpmmon_control;

use strict;
use DB_File;
use RPM2;
use Data::Dumper;

sub get_current_rpms {
	my $new = shift;
	my @rpm_list = ();

	my $rpm_db = RPM2->open_rpm_db();
        my $iter = $rpm_db->find_all_iter();
        
        while ( my $rpm = $iter->next ) {
                push @rpm_list , $rpm->tag('Name');
        };
        @rpm_list = sort @rpm_list;

	if (! -e "rpm_orig" || $new) {
		my %HASH = ();
          	tie (%HASH,"DB_File","rpm_orig",O_CREAT|O_RDWR);
         	%HASH  = map {$_ => 1} @rpm_list;
         	untie %HASH
	} 
	return @rpm_list;
}


sub get_changes {
	my %START = ();
	my @new_on_system = ();
	my @deleted_on_system = ();
	my @rpms_on_system = get_current_rpms();
	my $rpm_counter = 0;
	my %rpm_on_sys_hash = map {$_ => 1} @rpms_on_system;
	tie (%START,"DB_File","rpm_orig",O_RDWR); 
	foreach my $rpm_on_sys (@rpms_on_system) {
		push (@new_on_system,$rpm_on_sys) if (! exists $START{$rpm_on_sys});
		$rpm_counter += 1;
	}

	foreach my $rpm_start (keys %START) {
                push (@deleted_on_system,$rpm_start) if (! exists $rpm_on_sys_hash{$rpm_start});
        }
	untie(%START);	
	return ($rpm_counter,\@new_on_system,\@deleted_on_system);	
}

1;
