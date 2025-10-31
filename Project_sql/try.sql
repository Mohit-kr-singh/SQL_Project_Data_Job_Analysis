select job_location,
count(job_location) as count
from job_postings_fact
group by job_location
order by count desc