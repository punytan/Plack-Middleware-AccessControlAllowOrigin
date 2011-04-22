use strict;
use warnings;
use Test::More;
use Plack::Test;
use Plack::Builder;
use HTTP::Request::Common;

my $body = q!{"status":"ok"}!;

my $app = builder {
    enable 'Plack::Middleware::AccessControlAllowOrigin', origin => '*';

    sub {
        return [200, [], [$body]];
    };
};

test_psgi $app, sub {
    my $cb = shift;

    my $res = $cb->(GET "/");

    is $res->code, 200;
    is $res->header('Access-Control-Allow-Origin'), '*';
    is $res->content, $body;
};

done_testing;
