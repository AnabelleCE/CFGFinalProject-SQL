/*Create a relational database*/
CREATE DATABASE job_search;

/*Use it to create the tables*/
USE job_search;

/*Create at least five (5) tables in database*/
/*The first table will be some basic information on companies*/
CREATE TABLE company (
	ID INTEGER NOT NULL, 
	company_name VARCHAR(250) NOT NULL, 
	main_sector VARCHAR(250),
	main_industry VARCHAR(250),
/*Setting Primary Key Constraint*/
		PRIMARY KEY(ID)
);

/*Insert values into table*/
INSERT INTO company
	(ID, company_name, main_sector, main_industry)
	VALUES (
	1, 'Adobe', 'Technology','Software-Infrastructure'),
	(2, 'AirBnB','Consumer-Cyclical', 'Travel'),
	(3, 'AMEX', 'Financial', 'Credit'),
	(4, 'Google', 'Communication', 'Internet-Content'),
	(5, 'Mastercard', 'Financial', 'Credit'),
	(6, 'Meta', 'Communication', 'Internet-Content'),
	(7, 'Spotify', 'Communication', 'Internet-Content'),
	(8, 'TikTok', NULL, NULL),
	(9, 'Uber', 'Technology', 'Software-Application'),
	(10, 'VISA', 'Financial', 'Credit'
);

/*The second table will list roles applied to and date when applied*/
CREATE TABLE roles (
	role_ID INTEGER NOT NULL,
	req_number VARCHAR(250), 
	role_tittle VARCHAR(250), 
	company_ID INTEGER NOT NULL,
/*Setting Primary & ForeignKey Constraint*/
		PRIMARY KEY(role_ID),
		FOREIGN KEY(company_ID) REFERENCES company(ID)
);

/*Insert values into table*/
INSERT INTO roles
	(role_ID, req_number, role_tittle, company_ID)
	VALUES (
    1, 'R143218', 'Associate Value Consultant', 1),
	(2, 'R143561', 'Sales Operations Analyst', 1),
	(3, NULL, 'Senior Strategic Operations Associate', 9),
    (4, NULL, 'Programs and Business Operations Lead', 2),
    (5, 'R-206758' ,'Specialist, Product Management (Data Science and Analytics)', 5),
    (6, NULL, 'Analyst, Visa Consulting & Analytics', 10),
    (7,'A26872', 'Business Operations Solution Associate', 8),
    (8, NULL, 'Associate Product Marketing Manager, Early Career', 4),
    (9, NULL, NULL, 7),
    (10, NULL, 'Data Analyst', 6),
    (11, '24000728' , 'Digital Data Analyst (Merchant Digital Analytics & Research', 3
);

/*The third table will have salary information on each role*/
/*all roles are assumed to be in a state where anticipated salary is provided */
CREATE TABLE role_salary (
	salary_ID INTEGER NOT NULL,
	req_ID INTEGER NOT NULL,
	min_salary INTEGER NOT NULL, 
	max_salary INTEGER, 
/*Setting Primary & Foreign Key Constraint*/
		PRIMARY KEY(salary_ID),
		FOREIGN KEY (req_ID) REFERENCES roles(role_ID)
);

/*Insert values into table*/
INSERT INTO role_salary
	(salary_ID, req_ID, min_salary, max_salary)
	VALUES (
    1, 1, 91900, 179100),
	(2, 2, 61600, 133800),
    (3, 3, 124000, 137000),
    (4, 4, 160000, 194500),
    (5, 5, 89000, 141000),
    (6, 6, 113700, 145000),
    (7, 7, 77000, 100000),
    (8, 8, 85500, 124000),
    (9, 9, 0, NULL),
    (10, 10, 176400, 198000),
    (11, 11, 60000, 110000 
);

/*The fourth table will higlight some minumum years experience requierement for the role*/
CREATE TABLE experience (
	exp_ID INTEGER NOT NULL,
	role_number INTEGER NOT NULL,
	min_years INTEGER, 
/*Setting Primary & Foreign Key Constraint*/
		PRIMARY KEY(exp_ID),
		FOREIGN KEY (role_number) REFERENCES roles(role_ID)
);

/*Insert values into table*/
INSERT INTO experience
	(exp_ID, role_number, min_years)
	VALUES (
	1, 1, NULL),
	(2, 2, NULL),
	(3, 3, 4),
    (4, 4, 10),
    (5,5, NULL),
    (6, 6, 2),
    (7, 7, 1),
    (8,8, NULL),
    (9, 9, NULL),
    (10, 10, 1),
    (11, 11, 1
);

/*The fifth table will higlight programming language requierement for the role*/
CREATE TABLE prog_exp (
	prog_ID INTEGER NOT NULL,
	role_exp INTEGER NOT NULL,
	prog_lang VARCHAR(250), 
/*Setting Primary & Foreign Key Constraint*/
		PRIMARY KEY(prog_ID),
		FOREIGN KEY (role_exp) REFERENCES experience(exp_ID)
);

/*Insert values into table*/
INSERT INTO prog_exp
	(prog_ID, role_exp, prog_lang)
	VALUES (
	1, 1, NULL),
	(2, 2, Null),
	(3, 3,'SQL'),
    (4, 4,'SQL'),
    (5, 5, 'Python'),
    (6, 5, 'R'),
    (7, 5, 'SQL'),
    (8, 6, 'SAS'),
    (9, 6, 'R'),
    (10, 7, NULL),
    (11, 8, NULL),
    (12, 9, NULL),
    (13, 10, 'SQL'),
    (14, 10, 'R'),
    (15, 10, 'Python'),
    (16, 11, 'SQL'
);

/*The sixth table will have the application status and portal URL to the login page*/
CREATE TABLE app_status (
	stat_ID INTEGER NOT NULL,
	role_numb INTEGER NOT NULL,
	url VARCHAR(250), 
	stat VARCHAR(250), 
/*Setting Primary & Foreign Key Constraint*/
		PRIMARY KEY(stat_ID),
		FOREIGN KEY (role_numb) REFERENCES roles(role_ID)
);

/*Insert values into table*/
INSERT INTO app_status
	(stat_ID, role_numb, url, stat)
	VALUES (
    1, 1, 'https://adobe.wd5.myworkdayjobs.com/en-US/external_experienced/login?redirect=%2Fen-us%2Fexternal_experienced%2FuserHome', 'In Process'),
	(2, 2, 'https://adobe.wd5.myworkdayjobs.com/en-US/external_experienced/login?redirect=%2Fen-us%2Fexternal_experienced%2FuserHome', 'In Process'),
	(3, 3, 'https://www.uber.com/global/en/careers/list/127489/?uclick_id=a71fbc1d-b22b-465a-911d-2524c244ca95', 'Not Applied'),
    (4, 4, 'https://careers.airbnb.com/positions/5592531/', 'Not Applied'),
    (5, 5, 'https://careers.mastercard.com/us/en/job/MASRUSR206758EXTERNALENUS/Specialist-Product-Management-Data-Science-and-Analytics?utm_medium=phenom-feeds&source=LINKEDIN&utm_source=linkedin', 'Application Received'),
    (6, 6, 'https://jobs.smartrecruiters.com/oneclick-ui/company/Visa/publication/977f3c58-9d58-47b3-807c-6037a4a8c8d9/expired?dcr_ci=Visa&source=BuiltInNYC&jobId=5848397866&companyId=57a11f9de4b09d766b5b5dd6', 'Not Considered'),
    (7, 7, 'https://careers.tiktok.com/position/7262730404108503356/detail', 'Resume Screening'),
    (8, 8, 'https://www.google.com/about/careers/applications/jobs/results/75987350129124038-associate-product-marketing-manager/?src=Online/LinkedIn/linkedin_us&utm_source=linkedin&utm_medium=jobposting&utm_campaign=contract', 'Submitted'),
    (9, 9, NULL, NULL),
    (10, 10, 'https://www.metacareers.com/jobs/677394667598499/', 'Not Applied'),
    (11, 11, 'https://aexp.eightfold.ai/careers?pid=20173654&location=New%20York%2C%20New%20York%2C%20United%20States&Select%20Skills=SQL&triggerGoButton=true', 'Not Applied'
);

/*The seventh table will have the date applied to the role*/
CREATE TABLE app_dates (
	date_ID VARCHAR(250) NOT NULL, 
	date_applied DATE,
    stat_ID INTEGER NOT NULL, 
/*Setting Primary & ForeignKey Constraint*/
		PRIMARY KEY(date_ID),
		FOREIGN KEY(stat_ID) REFERENCES app_status(stat_ID)
);

/*Insert values into table*/
INSERT INTO app_dates
	(date_ID, date_applied, stat_ID)
	VALUES (
    1, '2024-01-12', 1),
    (2, '2024-01-28', 2),
	(3, NULL, 3),
    (4, NULL, 4),
    (5,'2023-12-15', 5),
    (6,'2023-12-15', 6),
    (7,'2023-12-12', 7),
    (8,'2023-12-18', 8),
    (9, NULL, 9),
    (10, NULL, 10),
    (11, NULL, 11    
);

/*Use joins to combine multiple tables in a logical way*/
/*If we want to look at the minimum salary for the roles actually applied*/
SELECT req_number, role_tittle, company_ID, min_salary
FROM roles r
	LEFT JOIN role_salary s
		ON r.role_ID = s.req_id;
        
/*Create a stored function */
/*If we want to store a functions that calculates the average minimum salary
of all the roles applied, we can do the below*/
DELIMITER // 
/*temporarily changes symbol indicating where statement ends*/
CREATE FUNCTION avg_min_sal()
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
	DECLARE sum_sal DECIMAL(10, 2);
    DECLARE num_roles INT;
    DECLARE avg_min_sal_result DECIMAL(10, 2);
	SELECT SUM(min_salary), COUNT(*) INTO sum_sal, num_roles
		FROM role_salary;
	IF num_roles > 0 THEN
        SET avg_min_sal_result = sum_sal / num_roles;
    ELSE
        SET avg_min_sal_result = 0;
    END IF;
    RETURN avg_min_sal_result;
END //
DELIMITER ; /*resets ; as the end symbol*/
SELECT avg_min_sal()
;

/*Query and subquery to extract data from database*/
/*In this example we want to find out which companies have an inidcated ideal minimum salary
and also is not missing information on the maximum salary anticipated*/
SELECT r.company_ID, rs.min_salary, rs.max_salary, c.company_name
FROM roles r
JOIN (
		SELECT req_ID, min_salary, max_salary
		FROM role_salary
		WHERE max_salary IS NOT NULL
			AND min_salary >= 120000) AS rs 
	ON r.COMPANY_id = rs.req_ID
JOIN company c
	ON r.company_ID = c.ID
;

/* Create a database diagram to show relatioship


/*ADVANCED PROJECT REQUIREMENTS*/
/*Create a stored procedure and demonstrate how it runs*/
/*This procedure will check the status of a particular application
using the URL, so that we can see if it matches with the site info.
If it does not match, user can take proper steps to update*/
DELIMITER // 
CREATE PROCEDURE stat_update(IN link VARCHAR(250))
/*the IN statement allows for specific url search*/
BEGIN
SELECT role_numb, stat 
	FROM app_status
    WHERE url = link;
END //
DELIMITER ; 

CALL stat_update('https://adobe.wd5.myworkdayjobs.com/en-US/external_experienced/login?redirect=%2Fen-us%2Fexternal_experienced%2FuserHome')
;

/*Create view using 3-4 base tables; prepare, demonstrate query using view 
to produce logically arranged result for analysis.*/
/*For the view lets imagine we have a mentor that we want to share our progress with
for that we will share the name of the role, comany, date of application, status*/
CREATE VIEW stat_check
AS
	SELECT r.role_tittle, c.company_name, d.date_applied, s.stat
    FROM roles r
    JOIN company c
		ON  c.ID = r.company_ID
	JOIN app_status s
		ON s.role_numb = r.role_ID
	JOIN app_dates d
		ON d.stat_ID = s.stat_ID;
;
SELECT *
	FROM stat_check
;

/*Prepare example query w/ GROUP BY and HAVING to demonstrate extracting 
data from DB for analysis*/
/*In this example we want to look at the different sectors, industry combinations
repesented by the companies for this we run a GROUP BY query with both columns */
SELECT main_sector, main_industry
	FROM company
	GROUP BY  main_sector, main_industry
;

/* to see the distince inustry, sectors individually, then we run them seperately*/
SELECT main_sector
	FROM company
    WHERE main_sector IS NOT NULL
	GROUP BY main_sector
;

SELECT main_industry
	FROM company
    WHERE main_industry IS NOT NULL
	GROUP BY main_industry
;

/*For the HAVING statement below, we want to find out which industries 
are more welcoming to entry level talent, in this scenario meaning 
3 years or less, based on min years requirements of roles aoplied to.
Distinct will show us the unique values only*/
SELECT DISTINCT c.main_industry
	FROM company c
JOIN roles r
	ON r.company_ID = c.ID
JOIN experience e
	ON e.role_number = r.role_ID
WHERE c.main_industry IS NOT NULL
GROUP BY c.main_industry, e.min_years
HAVING e.min_years <= 3
;