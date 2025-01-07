use project;
select count(b.book_id) as 'Total_books_of_February_month'  from book b inner join lending_books l 
on b.book_id=l.book_id
where extract(month from l.date_of_checkout)=02 
 ;
 
 select g.genres_name as category,count(g.genres_id) as 'count_of_books' from book b inner join lending_books l inner join genres_lookup g inner join borrower b1 
on b.book_id=l.book_id 
and b.book_genres=g.genres_id and l.card_no=b1.card_no where extract(month from l.date_of_checkout)=02 
group by  g.genres_name 
;

select b1.borrower_name, b.book_title,p.pub_name,g.genres_name as category,l.date_of_checkout from book b inner join lending_books l inner join genres_lookup g inner join borrower b1 inner join publisher p
on b.book_id=l.book_id and p.pub_id=b.pub_id
and b.book_genres=g.genres_id and l.card_no=b1.card_no where extract(month from l.date_of_checkout)=02 
group by b.book_title,p.pub_name,b1.borrower_name,g.genres_name,l.date_of_checkout ;

select g.genres_name as category,count(g.genres_id) as 'count_of_books' from book b inner join lending_books l inner join genres_lookup g  
on b.book_id=l.book_id 
and b.book_genres=g.genres_id  where extract(month from l.date_of_checkout)=02 
group by  g.genres_name order by count_of_books desc limit 1
;

select b1.Borrower_name,g.genres_name,count(g.genres_id) as 'count_of_books' from book b inner join lending_books l inner join genres_lookup g inner join borrower b1 
on b.book_id=l.book_id 
and b.book_genres=g.genres_id and l.card_no=b1.card_no where extract(month from l.date_of_checkout)=2 
group by  b1.Borrower_name,g.genres_name order by count_of_books desc limit 1;


select b1.Borrower_name,count(b1.Card_no) as 'count_of_books' from  lending_books l  inner join borrower b1 
on  l.card_no=b1.card_no where extract(month from l.date_of_checkout)=02 
group by  b1.borrower_name order by count_of_books desc limit 1 ;

select b1.Borrower_name,g.genres_name,count(g.genres_id) as 'count_of_books' from book b inner join lending_books l inner join genres_lookup g inner join borrower b1 
on b.book_id=l.book_id 
and b.book_genres=g.genres_id and l.card_no=b1.card_no where extract(month from l.date_of_checkout)=2 
group by  b1.Borrower_name,g.genres_name order by b1.Borrower_name;

select b1.Borrower_name,count(b1.Card_no) as 'count_of_books' from  lending_books l  inner join borrower b1 
on  l.card_no=b1.card_no where extract(month from l.date_of_checkout)=02 
group by b1.Borrower_name  order by count_of_books desc 
;
