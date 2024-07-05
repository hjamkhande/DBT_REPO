select dept.deptid deptid, dept.deptname deptname , max(emp.salary) maxsal
from employee emp join deartment dept 
on emp.deptid = dept.deptid
group by  dept.deptid, dept.deptnamecd