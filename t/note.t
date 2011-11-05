#!/usr/bin/perl -w

BEGIN {
    if( $ENV{PERL_CORE} ) {
        chdir 't';
        @INC = ('../lib', 'lib');
    }
    else {
        unshift @INC, ( 't/lib', 'lib' );
    }
}

use strict;
use warnings;

use Test::Builder::NoOutput;

BEGIN { require 't/test.pl'; }
plan(2);

{
    my $tb = Test::Builder::NoOutput->create;

    $tb->note("foo");

    $tb->reset_outputs;

    is $tb->read('out'), "# foo\n";
    is $tb->read('err'), '';
}

