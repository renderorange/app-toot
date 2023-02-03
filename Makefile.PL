use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'App::Toot',
    AUTHOR => 'Blaine Motsinger <blaine@renderorange.com>',
    ABSTRACT_FROM => 'lib/App/Toot.pm',
    VERSION_FROM => 'lib/App/Toot.pm',
    LICENSE => 'mit',
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url => 'https://github.com/renderorange/app-toot.git',
                web => 'https://github.com/renderorange/app-toot',
            },
        },
    },

    MIN_PERL_VERSION => '5.10.1',
    BUILD_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',  # for TEST_REQUIRES
    },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',
    },
    PREREQ_PM => {
        'Config::Tiny' => 0,
        'Getopt::Long' => '2.45',  # 2.36 is required for options we need, but at least 2.45 for bugfixes
        'Mastodon::Client' => 0,
        'Pod::Usage' => '1.67',  # rewrite in 1.62, bugfixes in 1.67
        'strict' => 0,
        'warnings' => 0,
    },

    EXE_FILES => [
        'bin/toot',
    ],
);