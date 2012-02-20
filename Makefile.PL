
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Module for administration of Hadoop clusters",
  "AUTHOR" => "Charles A. Wimmmer (charles\@wimmer.net)",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "TAP::Harness::JUnit" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Hadoop-Admin",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Hadoop::Admin",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "JSON" => 0,
    "LWP::Protocol::https" => 0,
    "LWP::Protocol::socks" => 0,
    "LWP::UserAgent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.2_05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



