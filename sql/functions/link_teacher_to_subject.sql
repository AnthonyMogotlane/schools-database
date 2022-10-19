create or replace function link_teacher_to_subject(the_teacher_id int, the_subject_id int)
    returns boolean as
$$
declare
total int;
begin
    select into total count(*) from teacher_subject
    where the_teacher_id = teacher_id and the_subject_id = subject_id;

    if(total = 0) then
        insert into teacher_subject (teacher_id, subject_id) 
        values (the_teacher_id, the_subject_id);
        return true;
    else
        return false;
    end if;
end;
$$
Language plpgsql;
            