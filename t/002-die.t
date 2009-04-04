#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;
use Unwind::Protect;
use Test::Exception;

# XXX: If you insert code, be sure to adjust every subsequent line number!

my @calls;

throws_ok {
    unwind_protect { die "ahhh" }
      after => sub { push @calls, 'protected' };
} qr{^ahhh at .*002-die.* line 13\b};

is_deeply([splice @calls], ['protected']);

