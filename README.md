# 8_Week_Sql_Challenge_Case_1
Danny's Dinner Case Study - 1



# Introduction

Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

# Problem Statement
Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program.

# Tables used
Three Tables used in this case study:

Sales: The sales table captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.

![Screenshot 2024-03-29 113619](https://github.com/AnunayDubey/8_Week_Sql_Challenge_Case_1/assets/140899990/3d52893b-5ccb-4d8d-9b78-f4f7ba3f5cd9)

Menu: The menu table maps the product_id to the actual product_name and price of each menu item.
![Screenshot 2024-03-29 113624](https://github.com/AnunayDubey/8_Week_Sql_Challenge_Case_1/assets/140899990/dd33cf06-7d6f-4c6a-8dc9-17487bf4a64f)

Members: The members table captures the join_date when a customer_id joined the beta version of the Danny’s Diner loyalty program.
![Screenshot 2024-03-29 113628](https://github.com/AnunayDubey/8_Week_Sql_Challenge_Case_1/assets/140899990/316ea0dd-b18f-4813-ab0f-589cc267fc1f)

# ER Diagram

![Screenshot 2024-03-29 113139](https://github.com/AnunayDubey/8_Week_Sql_Challenge_Case_1/assets/140899990/ac40cdf5-20aa-4151-a990-a50e7f15f958)



# Questions
What is the total amount each customer spent at the restaurant?


How many days has each customer visited the restaurant?



What was the first item from the menu purchased by each customer?


What is the most purchased item on the menu and how many times was it purchased by all customers?


Which item was the most popular for each customer?


Which item was purchased first by the customer after they became a member?


Which item was purchased just before the customer became a member?


What is the total items and amount spent for each member before they became a member?


If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?


In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
