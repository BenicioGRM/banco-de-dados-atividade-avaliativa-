-- 1. para ver quantos filmes tem em portugues

select count (*) from film f
		inner join "language" l on l.language_id = f.language_id
		where l."name"='portuguese';
	
-- 2. quantos clientes alugaram o filme de id 7?

select count(customer_id) from rental join inventory i on rental.inventory_id = i.inventory_id where film_id = 7;
 
--3.quantos alugueis foram feitos no total

select count(*) from rental;

--4.qual o custo do filme de id 600

select title, replacement_cost from film where film_id = 600

--5.qual FUNCIONARIO alugou mais FILMES

select s.first_name, s.last_name from staff s join rental r on s.staff_id = r.staff_id group by s.first_name, s.last_name limit 1;

--6.quantos funcionarios tem em cada loja?

select store_id, count(*)
from staff 
group by store_id;

-- 7. liste as seguintes colunas: titulo do filme, idioma,custo,data do ultimo aluguel, nome do cliente do ultimo aluguel, funcionario que aluou, loja do aluguel, preco do aluguel

select
	f.title,
	l.name,
	f.replacement_cost,
	r.rental_date,
	c.first_name,
	c.last_name,
	s.first_name,
	s.last_name,
	f.rental_rate
from
	rental r
join inventory i on
	r.inventory_id = i.inventory_id
join film f on
	i.film_id = f.film_id
join customer c on
	r.customer_id = c.customer_id
join staff s on
	r.staff_id = s.staff_id
join language l on
	f.language_id = l.language_id
limit 10;

--8. quantos atores participam do filme de id=1?
select store_id, count(*)
	from staff s 
	group by store_id 
	order by count(*) desc 
	limit 1;