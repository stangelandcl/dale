#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} -lm $test_dir/t/src/invoke-var.dt -o invoke-var`;
is(@res, 0, 'No compilation errors');

@res = `./invoke-var`;
is($?, 0, 'Program executed successfully');

chomp for @res;
is_deeply(\@res, [qw(called)],
    'Got expected results');

`rm invoke-var`;

1;
