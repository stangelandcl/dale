#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/mr-struct.dt -o mr-struct  `;
is(@res, 0, 'No compilation errors');

@res = `./mr-struct`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [
    '10',
    'a'
], 'Got expected results');

`rm mr-struct`;

1;
