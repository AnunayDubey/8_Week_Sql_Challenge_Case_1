----Q1.What is the total amount each customer spent at the restaurant?

SELECT
    s.customer_id,
    SUM(m.price) AS total_amount_spent
FROM
    sales s
JOIN
    menu m ON s.product_id = m.product_id
GROUP BY
    s.customer_id
	
	
	
	
---Q2.How many days has each customer visited the restaurant?
select customer_id,
       count(distinct order_date) as days_visited
from sales

group by customer_id

--Q3.What was the first item from the menu purchased by each customer?
SELECT
    s.customer_id,
    m.product_name AS first_item_purchased
FROM
    (
        SELECT
            customer_id,
            product_id,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS purchase_rank
        FROM
            sales
    ) AS s
JOIN
    menu AS m ON s.product_id = m.product_id
WHERE
    s.purchase_rank = 1



---Q4.What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT m.product_name, COUNT(s.product_id) AS total_purchases
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY total_purchases DESC
LIMIT 1

---Q5.Which item was the most popular for each customer?

SELECT s.customer_id, m.product_name, COUNT(s.product_id) AS total_purchases
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id, m.product_name
ORDER BY s.customer_id, total_purchases DESC
LIMIT 1

---Q6.Which item was purchased first by the customer after they became a member?


SELECT m.customer_id, m.join_date, s.product_id, MIN(s.order_date) AS first_purchase_date
FROM sales s
JOIN members m ON s.customer_id = m.customer_id
WHERE s.order_date > m.join_date
GROUP BY m.customer_id, m.join_date, s.product_id
ORDER BY m.customer_id, first_purchase_date;


---Q7.Which item was purchased just before the customer became a member?

SELECT 
    s.customer_id, m.join_date,s.order_date AS purchase_date,m.join_date AS member_join_date,
    m.join_date - s.order_date AS days_diff,m.customer_id AS new_member_customer_id,s.product_id,
    mn.product_name
FROM 
    sales s
JOIN 
    members m ON s.customer_id = m.customer_id
JOIN 
    menu mn ON s.product_id = mn.product_id
WHERE 
    s.order_date < m.join_date
ORDER BY 
    s.customer_id, s.order_date DESC;




---Q8.What is the total items and amount spent for each member before they became a member?

SELECT s.customer_id, COUNT(s.product_id) AS total_items_purchased, SUM(m.price) AS total_amount_spent
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date < mem.join_date
GROUP BY s.customer_id;


---Q9.If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

WITH points AS (
    SELECT s.customer_id, SUM(m.price) AS total_amount_spent
    FROM sales s
    JOIN menu m ON s.product_id = m.product_id
    GROUP BY s.customer_id
)
SELECT customer_id, 
       total_amount_spent * 10 AS points,
       CASE WHEN customer_id = 'A' THEN total_amount_spent * 20 ELSE total_amount_spent * 10 END AS total_points_with_bonus
FROM points


---In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH points AS (
    SELECT s.customer_id, SUM(m.price) AS total_amount_spent
    FROM sales s
    JOIN menu m ON s.product_id = m.product_id
    WHERE s.order_date BETWEEN '2021-01-07' AND '2021-01-31' -- First week after joining
    GROUP BY s.customer_id
)
SELECT customer_id, 
       total_amount_spent * 10 AS points,
       CASE WHEN customer_id = 'A' THEN total_amount_spent * 20 ELSE total_amount_spent * 10 END AS total_points_with_bonus
FROM points










