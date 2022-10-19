create or replace function add_teacher(the_first_name text, the_last_name text, the_email text)
    returns boolean as
$$
declare
    total int;
begin
    select into total count(*) from teacher
    where lower(email) = lower(the_email);

    if (total = 0) then
        insert into teacher (first_name, last_name, email)
        values (the_first_name, the_last_name, the_email);
        return true;
    else    
        return false;
    end if;
end;
$$
Language plpgsql;
     
