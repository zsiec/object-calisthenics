require 'active_support/core_ext/object/try'

$:.unshift File.dirname(__FILE__)
autoload :Job, 'lib/models/job'
autoload :User, 'lib/models/user'
autoload :Jobseeker, 'lib/models/jobseeker'
autoload :JobseekerJobManager, 'lib/models/jobseeker_job_manager'
autoload :JobseekerJob, 'lib/models/jobseeker_job'
autoload :JobseekerSavedJob, 'lib/models/jobseeker_saved_job'
autoload :JobseekerAppliedJob, 'lib/models/jobseeker_applied_job'
autoload :JobseekerAppliedJobs, 'lib/models/jobseeker_applied_jobs'
autoload :Recruiter, 'lib/models/recruiter'
autoload :RecruiterJobManager, 'lib/models/recruiter_job_manager'
autoload :UserJobManager, 'lib/models/user_job_manager'
autoload :RecruiterPostedJob, 'lib/models/recruiter_posted_job'
autoload :UserJob, 'lib/models/user_job'
autoload :JobType, 'lib/models/job_type'
autoload :Resume, 'lib/models/resume'
autoload :LaddersSearch, 'lib/models/ladders_search'
require 'lib/bootstrap'
