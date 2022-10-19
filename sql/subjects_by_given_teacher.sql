select subject.*
from subject
    join teacher_subject on subject.id = teacher_subject.subject_id
    join teacher on teacher_subject.teacher_id = teacher.id
where teacher.first_name = 'Yonela';
