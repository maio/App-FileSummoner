registerSkeleton(HasExt('pm'), 'perl/module/basic.pm');
registerSkeleton([PathContains('lib'), HasExt('t')], 'perl/test/spec.t');
registerSkeleton(HasExt('t'), 'perl/test/basic.t');
