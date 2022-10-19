create or replace function teacher_subjects (the_first_name text)
    returns table (
        name text
    ) as
$$
begin
    return query
    select subject.name as subjects
    from subject
        join teacher_subject on subject.id = teacher_subject.subject_id
        join teacher on teacher_subject.teacher_id = teacher.id
    where teacher.first_name = the_first_name;
end;
$$
Language plpgsql;