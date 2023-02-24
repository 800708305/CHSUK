select * from SYSCompanyMaster where CompanyName like 'hire%'

--41	HireTalent
--262986	HireTalent_

-- Duplicate job
DECLARe @tbDuplicateJobs TABLE(
	JobDetailId_41 Numeric(18,0),
	JobDetailId_262986 Numeric(18,0)
)

INSERT INTO @tbDuplicateJobs
select A.JobDetailId, B.JobDetailId
FROM JobDetail A 
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41

select * from @tbDuplicateJobs


 Daily Activity
select A.JobDetailId, B.JobDetailId,  DA.* 
from DailyActivity DA
INNER JOIN JobDetail A on DA.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

DISABLE Trigger DailyActivityLMD on DailyActivity
GO

UPDATE DA SET DA.JobdetailId = B.JobDetailId
from DailyActivity DA
INNER JOIN JobDetail A on DA.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

Enable Trigger DailyActivityLMD on DailyActivity
GO

-- job submission
select A.JobDetailId, B.JobDetailId,  JS.* 
from JobSubmission JS
INNER JOIN JobDetail A on JS.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

DISABLE Trigger JobSubmissionLMD on JobSubmission
GO

UPDATE JS SET JS.JobdetailId = B.JobDetailId
from JobSubmission JS
INNER JOIN JobDetail A on JS.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

Enable Trigger JobSubmissionLMD on JobSubmission
GO

-- Job Assignment
select A.JobDetailId, B.JobDetailId,  JA.* 
from JobAssignment JA 
INNER JOIN JobDetail A on JA.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

DISABLE Trigger JobAssignmentLMD on JobAssignment
GO

UPDATE JA SET JA.JobdetailId = B.JobDetailId
from JobAssignment JA
INNER JOIN JobDetail A on JA.JobDetailId = A.JobDetailId
inner join JobDetail B on A.JobID = B.JobID
where A.CompanyId = 262986 and B.CompanyId = 41
GO

Enable Trigger JobAssignmentLMD on JobAssignment
GO

-- Job Detail - Update endclient

select * 
FROM SYSClientEndClient A
INNER JOIN SYSCompanyMaster B on A.EndClientId = B.CompanyId
where A.ClientId = 262986 --and B.CompanyId = 41

select * 
FROM SYSClientEndClient A
INNER JOIN SYSCompanyMaster B on A.EndClientId = B.CompanyId
where A.ClientId =  41


-- Job Detail - How to update endclient in jobdetail ????????
select * from JobDetail where CompanyId = 262986 
select * from JobDetail where CompanyId = 41 
GO

DISABLE Trigger JobDetailLMD on JobDetail
GO

UPDATE JobDetail set CompanyId = 41 where CompanyId = 262986
GO

Enable Trigger JobDetailLMD on JobDetail
GO

-- Seat Allocation
select * from ClientSeatAllocation where CompanyId = 262986

-- Seat Master
select * from ClientSeatMaster where ClientId = 262986

select * from SYSClientEndClient where ClientId = 262986

select * from SYSClientEndClient where ClientId = 41
