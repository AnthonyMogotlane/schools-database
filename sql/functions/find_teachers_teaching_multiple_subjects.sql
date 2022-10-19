create or replace function find_teachers_teaching_multiple_subjects(num int)
    returns table (
        id int,
        first_name text,
        last_name text,
        email text
    ) as
$$
begin
return query
    select teacher.*
    from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
    group by teacher.id, teacher.first_name, teacher.last_name, teacher.email
    having count(*) = num; 
end;
$$
Language plpgsql;