select dept.deptid deptid, dept.deptname deptname , max(emp.salary) maxsal , min(emp.salary) minsal, count(empid) emp_cnt
from employee emp join deartment dept 
on emp.deptid = dept.deptid
group by  dept.deptid, dept.deptname