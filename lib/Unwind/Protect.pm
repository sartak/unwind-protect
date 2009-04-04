package Unwind::Protect;
use strict;
use warnings;
use Sub::Uplevel;
use Sub::Exporter -setup => {
    exports => ['unwind_protect'],
    groups  => {
        default => ['unwind_protect'],
    },
};

sub unwind_protect (&@) {
    my $code = shift;
    my %args = @_;

    my $wantarray = wantarray;

    my @ret;

    eval {
        if ($wantarray) {
            @ret = uplevel 1, $code;
        }
        elsif (defined $wantarray) {
            $ret[0] = uplevel 1, $code;
        }
        else {
            uplevel 1, $code;
        }
    };

    my $exception = $@;

    $args{after}->() if $args{after};

    die $exception if $exception;

    return @ret if $wantarray;
    return $ret[0] if defined $wantarray;
    return 0;
}

1;

