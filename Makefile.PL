use inc::Module::Install;
name 'Plack-Middleware-AccessControlAllowOrigin';
all_from 'lib/Plack/Middleware/AccessControlAllowOrigin.pm';

requires 'Plack::Middleware';
requires 'Plack::Util';
requires 'Plack::Util::Accessor';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More', 0.98;
auto_set_repository;
auto_include;
WriteAll;
