
/* -------------------- Professor vs Real Class Table

create table PROFESSOR_CLASS(id_professor integer, name_professor varchar(100),  id_professorclass integer);

insert into PROFESSOR_CLASS(id_professor, name_professor, id_professorclass) values
(1, "Steve", 4),
(2, "Joana", 5),
(3, "Kelly", 8);



/* -------------------- id Class vs Class Name Table
create table CLASSES(id_class_c integer, title varchar(100));

insert into CLASSES(id_class_c, title) values
(1, "Math"),
(2, "Statistic"),
(3, "Physics"),
(4, "Geography"),
(5, "English"),
(6, "Literature"),
(7, "Programming"),
(8, "History");



/* -------------------- id Professor vs Classes that were given in the semester ----------------------------------------

create table SEMESTER_CLASS(id_professor_sem integer, name_class varchar(100), id_class integer);

insert into SEMESTER_CLASS(id_professor_sem, name_class, id_class) values

(1, "Steve", 4),
(1, "Steve", 2),
(2, "Joana", 5),
(2, "Joana",8),
(3, "Kelly", 6),
(3, "Kelly", 3),
(3, "Kelly", 3);


/* -------------------- Q U E R Y ----------------------------------------
select name_professor, title

from
     (select  distinct TABLE2.name_professor, TABLE2.id_class

    from (
        select TABLE1.name_professor, TABLE1.id_class
        from(
            Select *
            from 
                SEMESTER_CLASS
                left join PROFESSOR_CLASS
                on PROFESSOR_CLASS.id_professor = SEMESTER_CLASS.id_professor_sem 
                
                 
            
            ) as TABLE1
            
            where TABLE1.id_professorclass <> TABLE1.id_class
            
            ) as TABLE2) AS TABLE3 
          left join CLASSES
          on CLASSES.id_class_c = TABLE3.id_class;
            
