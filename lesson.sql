-- Q1
create table departments (
  department_id int unsigned not null primary key auto_increment,
  name varchar(20) not null,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

-- Q2
alter table people add column department_id int unsigned after email;

-- Q3
insert into departments (name) values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

insert into people (name, email, department_id, age, gender) values
('田中みなみ', 'tanaka.mi@gizumo.jp', 1, 24, 2),
('小林りょうた', 'kobayashi@gizumo.jp', 1, 24, 1),
('川崎なおこ', 'kawasaki@gizumo.jp', 1, 40, 2),
('森嶋たけし', 'morishima@gizumo.jp', 2, 33, 1),
('佐々木いちろう', 'sasaki@gizumo.jp', 2, 22, 1),
('佐藤はなこ', 'sato@gizumo.jp', 2, 25, 2),
('石川けんた', 'ishikawa@gizumo.jp', 4, 30, 1),
('高橋みさき', 'takahashi@gizumo.jp', 3, 27, 2),
('松本だいすけ', 'matumoto@gizumo.jp', 2, 39, 1),
('中村ゆうこ', 'nakamura@gizumo.jp', 5, 29, 2);

insert into reports (person_id, content) values
(7, "資料整理完了しました。"),
(8, "クライアントと打ち合わせを実施。"),
(9, "システム不具合の調査を進行中。"),
(10, "日次データの集計完了済み。"),
(11, "新プロジェクトの提案資料作成中。"),
(12, "午前中はメール返信対応。"),
(13, "午後から社内研修を受講しました。"),
(14, "問い合わせ対応10件完了。"),
(15, "仕様書の内容を最終確認。"),
(16, "顧客からの要望を社内共有。");

-- Q4
update people set department_id = case
when person_id = 1 then 2
when person_id = 2 then 2
when person_id = 3 then 4
when person_id = 4 then 3
when person_id = 5 then 2
when person_id = 6 then 5 end where person_id in (1,2,3,4,5,6);

-- Q5
select name, age from people where gender = 1 order by age desc;

-- Q6
peopleテーブルから、
department_idカラムが1であるname、email、ageカラムを、
created_atが昇順になるように取得。

-- Q7
select name, age, gender from people
where (gender = 2 and age between 20 and 29) or (gender = 1 and age between 40 and 49);

-- Q8
select p.name, d.name, age from people p
join departments d using(department_id) where department_id = 1 order by age;

-- Q9
select gender, avg(age) as average_age from people
where gender = 2 and department_id = 2 group by gender;

-- Q10
select p.name, d.name, r.content from people p
inner join departments d on p.department_id = d.department_id
inner join reports r on p.person_id = r.person_id;

-- Q11
select p.name, r.content from people p
left outer join reports r using(person_id) where r.content is null;