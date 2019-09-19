# PHEmployeesResearchProject
The purpose of this project was evaluating an employee's CSV dataset with 300,024 records to look for any sort of data inconsistency. As a result, an incoherency between the salaries amount and job positions was detected.

# Technologies used: 
PostgreSQL 11 , SQLAlchemy, Python, Matplotlib, and Pandas.

# The following activities were performed to accomplish this research project:
## Data Modeling
The layouts of CSV files were checked to understand how should be the entities structure:
tables names;
fields names;
datatypes;
sizes;
primary keys;
foreign keys;
tables relationships.

## Data Engineering
The information collected on the step above was the base to create a graphical presentation of entities and their relationships, that means the Entity-Relationship Diagram (ERD). The image has been saved on ERD_EmployeesDB.png file and is presented below:;
A new physical database was created and named employeeDB;
The SQL schema was extracted from the tool used to design the ERD and stored in a file named schema.sql;
The SQL schema was adjusted to drop all tables if they exist and also to import all CSV files in batch mode, better than manually import one by one;
In the end, the SQL script was able to recreate the database structure and import the files in one shot, without any error.

## Data Analysis
One SQL script was created to store all queries required to the data analysis (DataAnalysis.sql);
During the analysis, something incoherent was detected between the salaries amount and the titles (or job position). The average salary of Engineer, Senior Engineer, and Assistant Engineer are pratically the same. A similar situation was found for Staff and Senior Staff, considering that these two positions have the highest average salaries in the company. Due to this intriguing discovery, a jupyter notebook with a bar chart of average salary by title was made to present the evidence.

### The final Entity Relationship Diagram is presented below: 
![](ERD/ERD_EmployeesDB.png)
