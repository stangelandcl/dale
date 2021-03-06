#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} -lm $test_dir/t/src/void-return.dt -o void-return`;
is(@res, 0, 'No compilation errors');

@res = `./void-return`;
is($?, 0, 'Program executed successfully');

chomp for @res;
is_deeply(\@res, ['void return'], 'Got expected results');

`rm void-return`;

1;
