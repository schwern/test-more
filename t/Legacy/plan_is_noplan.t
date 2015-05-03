#!/usr/bin/perl -w
use Test::Stream::Shim;

BEGIN {
    if( $ENV{PERL_CORE} ) {
        chdir 't';
        @INC = ('../lib', 'Legacy/lib');
    }
    else {
        unshift @INC, 't/Legacy/lib';
    }
}

use strict;

use Test::More tests => 1;

use Test::Builder::NoOutput;

{
    my $tb = Test::Builder::NoOutput->create;

    $tb->plan('no_plan');

    $tb->ok(1, 'foo');
    $tb->_ending;

    is($tb->read, <<OUT);
ok 1 - foo
1..1
OUT
}
