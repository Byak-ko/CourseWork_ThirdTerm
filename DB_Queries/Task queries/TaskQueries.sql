-- 1. Простий запит на вибірку всіх учасників клубу
--SELECT * FROM public.members;

-- 2. Запит на вибірку замовлень з ціною в заданому діапазоні
--SELECT * FROM order_infos WHERE price BETWEEN 100 AND 200;

-- 3. Запит на вибірку учасників з вказаними ID
--SELECT * FROM public.members WHERE id IN (1, 15, 19);

-- 4. Запит на вибірку учасників з іменем, що починається з певної літери
--SELECT * FROM public.members WHERE first_name LIKE 'А%';

-- 5. Запит на вибірку учасників з певною роллю та електронною поштою
--SELECT * FROM public.members WHERE role = 'Адміністратор' AND email LIKE '%@gmail.com';

-- 6. Запит на вибірку з двома умовами через "OR" для таблиці events з полями name та organizer
--SELECT * FROM events WHERE name LIKE '%Методи%' OR organizer = 'Aquarium Club';

-- 7. Запит на вибірку з використанням DISTINCT для таблиці evemts для унікальної локації:
--SELECT DISTINCT location FROM events;

--8. Запит з функцією MAX для таблиці events для знаходження найбільшої дати заходу:
--SELECT MAX(date) FROM events;

--9. Запит з функцією SUM для таблиці order_infos для підрахунку загальної суми замовлень:
--SELECT SUM(price) FROM order_infos;

-- 10. Запит з функцією COUNT для таблиці club_documents для підрахунку загальної кількості документів:
--SELECT COUNT(*) FROM club_documents;

--11. Запит на вибірку з використанням агрегатної функції та виведенням ще декількох полів:
--SELECT category, COUNT(*) AS total_items, AVG(id) AS average_item_id
--FROM item_infos GROUP BY category;

-- 12. Запит на вибірку з використанням агрегатної функції MIN для таблиці events та умовою на вибірку поля "location":
--SELECT MIN(date), location FROM events 
--WHERE location = 'Онлайн' GROUP BY location;

-- 13. Запит на вибірку з використанням агрегатної функції MAX для таблиці item_infos та умовою на агрегатну функцію:
--SELECT * FROM order_infos 
--WHERE price = (SELECT MAX(price) FROM order_infos);


-- 14. Запит на вибірку з використанням агрегатної функції, умовою на агрегатну функцію, умовою на вибірку поля з сортуванням даних.
--SELECT buyer_id, COUNT(*) AS total_orders FROM order_infos
--GROUP BY buyer_id
--HAVING COUNT(*) < 20
--ORDER BY total_orders DESC;


-- 15. Запит з використанням INNER JOIN для з'єднання таблиць members та event_participations:
--SELECT order_infos.id, order_infos.price, members.first_name, members.last_name
--FROM order_infos 
--INNER JOIN members ON order_infos.buyer_id = members.id;



--16. Запит з використанням LEFT JOIN для таблиці events для підрахунку загальної кількості учасників на заходах. 
--SELECT events.id, events.name,
--COUNT(event_participations.member_id) AS total_participants 
--FROM events
--LEFT JOIN event_participations ON events.id = event_participations.event_id
--GROUP BY events.id, events.name;

-- 17. Запит використовує RIGHT JOIN для отримання інформації про замовлення та імені покупців з таблиць order_infos та members відповідно.
--SELECT order_infos.id, order_infos.price, members.first_name, members.last_name
--FROM members
--RIGHT JOIN order_infos ON members.id = order_infos.buyer_id;

-- 18. Запит використовує INNER JOIN для отримання інформації про заходи та учасників з таблиць events та event_participations відповідно, з умовою, де ідентифікатор учасника дорівнює 1.
--SELECT events.id, events.name, event_participations.member_id
--FROM events
--INNER JOIN event_participations ON events.id = event_participations.event_id
--WHERE event_participations.member_id = 1;

-- 19. Запит з використанням INNER JOIN для злиття таблиць order_infos та members за умови, що ім'я покупця (взяте з таблиці members) починається з літери "М".
--SELECT order_infos.id, order_infos.price, members.first_name, members.last_name
--FROM order_infos
--INNER JOIN members ON order_infos.buyer_id = members.id
--WHERE members.first_name LIKE 'М%';

-- 20. Запит з використанням INNER JOIN і використанням агрегатної функції.
--SELECT item_infos.name, COUNT(order_infos.id) AS orders_count
--FROM order_infos
--INNER JOIN item_infos ON order_infos.item_info_id = item_infos.id
--GROUP BY item_infos.name;

-- 21. Запит з використанням INNER JOIN і використанням агрегатної функції і умови HAVING.
--SELECT events.name, COUNT(event_participations.member_id) AS participants_count
--FROM events
--INNER JOIN event_participations ON events.id = event_participations.event_id
--GROUP BY events.name
--HAVING COUNT(event_participations.member_id) > 10;

-- 22. Запит з використанням підзапита з використанням (=, <,>):
--SELECT name FROM fish_infos
--WHERE id = (SELECT MAX(id) FROM fish_infos);

-- 23. Запит з використанням підзапита з використанням агрегатної функції:
--SELECT id, price FROM order_infos 
--WHERE price > (SELECT AVG(price) FROM order_infos);

--24. Запит з використанням підзапита з використанням оператора EXIST.
--SELECT * FROM members m
--WHERE EXISTS (SELECT 1
--FROM event_participations ep
--WHERE ep.member_id = m.id);

-- 25. Запит вибирає ціни з таблиці order_infos, які перевищують будь-яку ціну, зазначену у підзапиті, де id дорівнює 27.
--SELECT price FROM order_infos
--WHERE price > ANY
--(SELECT price FROM order_infos WHERE id = 27);

--26. Цей запит вибирає всі записи з таблиці order_infos, де item_info_id міститься серед значень id, отриманих у підзапиті, який вибирає всі id з таблиці item_infos, де category рівне 'Риба'.
--SELECT * FROM order_infos
--WHERE item_info_id 
--IN (SELECT id FROM item_infos WHERE category = 'Риба');

--27. Запит з використанням підзапита і зв’язку INNER JOIN.
SELECT * FROM events
INNER JOIN event_participations ON events.id = event_participations.event_id
WHERE event_participations.member_id 
IN (SELECT id FROM members WHERE first_name = 'Михайло');

