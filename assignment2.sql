create database practice
CREATE TABLE student_results ( result_id INT PRIMARY KEY, student_name
VARCHAR(50), department VARCHAR(20), subject VARCHAR(30), marks INT,
exam_status VARCHAR(20) );


INSERT INTO student_results
(result_id, student_name, department, subject, marks, exam_status)
VALUES
(1, 'Arun',  'CSE', 'Java',   85, 'Completed'),
(2, 'Arun',  'CSE', 'SQL',    78, 'Completed'),
(3, 'Divya', 'ECE', 'Java',   65, 'Completed'),
(4, 'Kiran', 'CSE', 'Python', 32, 'Pending'),
(5, 'Divya', 'ECE', 'SQL',    72, 'Completed'),
(6, 'Arun',  'CSE', 'Python', 90, 'Completed'),
(7, 'Meena', 'ECE', 'Java',   88, 'Completed'),
(8, 'Kiran', 'CSE', 'SQL',    45, 'Completed'),
(9, 'Meena', 'ECE', 'Python', 30, 'Cancelled'),
(10, 'Divya','ECE', 'Python', 81, 'Completed'),
(11, 'Kiran','CSE', 'Java',   55, 'Completed'),
(12, 'Meena','ECE', 'SQL',    92, 'Completed');
select * from student_results

--GROUP BY WITH SUM()
/*Calculate the total marks obtained by each student across all
subjects. Display student_name and total_marks. Sort the result by
student_name.*/

SELECT student_name,sum(marks) AS total_marks
FROM [dbo].[student_results]
GROUP BY student_name
ORDER BY student_name ASC;

/*Calculate the total marks obtained in each subject by each
department. Display department, subject, and total_marks. Sort the
result by department and subject.*/

SELECT department,sum(marks) AS total_marks
FROM [dbo].[student_results]
GROUP BY department, subject
ORDER BY department ASC, subject ASC;

/*QUESTION 3 - COUNT(*) VS COUNT(column) VS COUNT(DISTINCT column)

Question: For each department, display: - Total result records. - Number
of records with a student_name. - Number of unique students.

Use COUNT(*), COUNT(student_name), and COUNT(DISTINCT student_name).
Sort the result by department.*/

SELECT
    department,
    COUNT(*) AS total_records,
    COUNT(student_name) AS records_with_student_name,
    COUNT(DISTINCT student_name) AS unique_students
FROM student_results
GROUP BY department
ORDER BY department ASC;

/*QUESTION 4 - CONDITIONAL AGGREGATION USING COUNT()

Question: For each department, count the number of exams with Completed,
Pending, and Cancelled statuses.

Display department, completed_exams, pending_exams, and cancelled_exams.
Sort the result by department.*/

SELECT
 department,
 COUNT(CASE WHEN exam_status = 'Completed' THEN 1 END) AS completed_exams,
 COUNT(CASE WHEN exam_status = 'Pending' THEN 1 END) AS pending_exams,
 COUNT(CASE WHEN exam_status = 'Cancelled' THEN 1 END) AS cancelled_exams
FROM student_results
GROUP BY department
ORDER BY department ASC;


/*QUESTION 5 - CONDITIONAL AGGREGATION USING SUM()

Question: Calculate the total marks from Completed exams for each
department. Do not include marks from Pending or Cancelled exams.

Display department and completed_exam_marks. Sort the result by
department.*/

SELECT
    department,
    SUM(CASE
            WHEN exam_status = 'Completed' THEN marks
            ELSE 0
        END) AS completed_exam_marks
FROM student_results
GROUP BY department
ORDER BY department ASC;
