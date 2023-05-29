set serveroutput on
declare
b_id books.b_id%type:=11;
b_title books.title%type:='Something Wicked This Way comes';
b_author books.author%type:='Ray Brudbary';
b_publishers_id books.publisher_id%type:=10;
b_publishdate books.publicationdate%type:=date'1975-01-18';
b_isbn books.isbn%type:=9781476746565;
b_price books.price%type:=250;
b_genre books.genre%type:='juvenile';


begin
--insert into books values(b_id,b_title,b_author,b_publishers_id,b_publishdate,b_isbn,b_price,b_genre);
end;
/


-- cursor

set serveroutput on

declare
cursor book_cursor is select * from books;
book_row books%rowtype;

begin
open book_cursor;
fetch book_cursor into book_row.b_id, book_row.title,book_row.author,book_row.publisher_id,book_row.publicationdate,book_row.isbn,book_row.price,book_row.genre;

while book_cursor%found
loop
dbms_output.put_line('id = '||book_row.b_id||'title = '||book_row.title);
dbms_output.put_line('Row count: '|| book_cursor%rowcount);
fetch book_cursor into book_row.b_id, book_row.title,book_row.author,book_row.publisher_id,book_row.publicationdate,book_row.isbn,book_row.price,book_row.genre;
end loop;
end;
/


--PROCEDURE
CREATE OR REPLACE PROCEDURE proc2(
  var1 IN NUMBER,
  var2 OUT VARCHAR2,
  var3 IN OUT NUMBER
)
AS

BEGIN
 
  select title into var2 from books where b_id=var1;
  var3 := var1 + 1; 
  
END;
/
set serveroutput on
declare 
b_id books.b_id%type:=1;
name books.title%type;
pub_id books.publisher_id%type;
begin
proc2(b_id,name,pub_id);
end;
/	



--FUNCTION
set serveroutput on
create or replace function test(var1 in varchar) return varchar AS
value books.price%type;
begin
select price into value from books where title = var1;
return value;
end;
/

set serveroutput on;
declare 
value varchar(20);
begin
value:=test('Inferno');
end;
/




