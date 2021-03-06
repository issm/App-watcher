use strict;
use warnings FATAL => 'all';
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    recursive_test_files => 1,
    dynamic_config       => 0,
    build_requires       => { 'Test::More' => '0.98' },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'Filesys::Notify::Simple' => '0',
        perl                      => '5.008008',
        ($^O eq 'linux' ? ('Linux::Inotify2' => 0) : ()),
    },
    no_index             => { 'directory' => [ 't', 'inc' ] },
    name                 => 'App-watcher',
    module_name          => 'App::watcher',
    script_files         => ['bin/watcher'],

    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? 't/ xt/' : 't/',

    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
