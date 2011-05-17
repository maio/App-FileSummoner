registerSkeleton(HasExt('pm'), 'perl/module/basic.pm');
registerSkeleton([BelowDirectory('lib'), HasExt('t')], 'perl/test/test-class.t');
registerSkeleton(HasExt('t'), 'perl/test/basic.t');
