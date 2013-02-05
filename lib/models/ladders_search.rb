class LaddersSearch
  def jobseekers_applied_on_date date
    APPLIED_JOBS.search_all created_on: date, return_type: :user
  end
end
