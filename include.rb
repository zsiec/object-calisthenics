require 'active_support/core_ext/object/try'

$:.unshift File.dirname(__FILE__)
autoload :Job, 'lib/models/job'
autoload :User, 'lib/models/user'
autoload :Jobseeker, 'lib/models/jobseeker'
autoload :JobseekerJobManager, 'lib/models/jobseeker_job_manager'
autoload :JobseekerJob, 'lib/models/jobseeker_job'
autoload :JobseekerSavedJob, 'lib/models/jobseeker_saved_job'
autoload :JobseekerAppliedJob, 'lib/models/jobseeker_applied_job'
