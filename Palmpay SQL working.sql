#1 RETRIEVE ALL ACCOUNTS WITH THEIR RESPECTIVE CUSTOMERS AND BRANCH INFORMATION
SELECT *
FROM
palmpay_db.customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
JOIN branches
ON accounts.branch_id = branches.branch_id
ORDER BY account_id;

#2. FIND ALL TRANSACTIONS FOR 'Checking' ACCOUNT TYPE, INCLUDING ACCOUNT AND CUSTOMER DETAILS
SELECT accounts.account_id, account_type, customers.customer_id, first_name,transactions.transaction_id, transaction_type
FROM
palmpay_db.transactions
JOIN accounts
ON accounts.account_id = transactions.account_id
JOIN customers
ON accounts.customer_id = customers.customer_id
WHERE accounts.account_type = 'Checking'
ORDER BY transactions.transaction_id;
  
#3. LIST ALL LOANS WITH CUSTOMER AND BRANCH DETAILS 
SELECT *
FROM
palmpay_db.loans
JOIN customers
ON customers.customer_id = loans.customer_id
JOIN branches
ON loans.branch_id = branches.branch_id;

#4. GET ALL CREDIT CARDS WITH THEIR ASSOCIATED CUSTOMER DETAILS
SELECT *
FROM
palmpay_db.creditcards
JOIN customers
ON customers.customer_id = creditcards.customer_id
ORDER BY card_id;

# 5. FIND ALL ACCOUNTS AND THEIR ASSOCIATED LOANS
SELECT *
FROM
palmpay_db.accounts
JOIN customers
ON accounts.customer_id = customers.customer_id
JOIN loans
ON customers.customer_id = loans.customer_id
ORDER BY accounts.customer_id;

# 6. RETRIEVE ALL TRANSACTIONS FOR A SPECIFIC BRANCH, INCLUDING BRANCH AND ACCOUNT DETAILS
SELECT *
FROM
palmpay_db.transactions
JOIN accounts
ON transactions.account_id = accounts.account_id
JOIN branches
ON accounts.branch_id = branches.branch_id
ORDER BY accounts.account_id;

#7. LIST ALL CUSTOMERS WITH THEIR 'CHECKING' AND 'SAVING' ACCOUNTS
SELECT *
FROM
palmpay_db.customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.account_type = 'checking' OR accounts.account_type = 'savings'
ORDER BY customers.customer_id;

# 8. GET ALL CREDIT CARD TRANSACTIONS ALONG WITH CARD AND CUSTOMER DETAILS
SELECT *
FROM
palmpay_db.creditcards
JOIN customers
ON creditcards.customer_id = customers.customer_id
ORDER BY customers.customer_id;

#9. FIND CUSTOMERS WITH LOANS AND THEIR CREDIT CARD DETAILS
SELECT customers.first_name, last_name, customers.customer_id, loans.loan_id,loans.customer_id, loan_amount, 
creditcards.card_id, creditcards.customer_id, card_number
FROM
palmpay_db.customers
JOIN Loans
ON customers.customer_id = loans.customer_id
JOIN creditcards
ON customers.customer_id = creditcards.customer_id
ORDER BY customers.customer_id;

#10. LIST ALL BRANCHES AND THE NUMBER OF ACCOUNTS AND LOANS ASSOCIATED WITH EACH BRANCH
SELECT branch_name, COUNT(loan_id)
FROM
palmpay_db.branches
JOIN loans
ON branches.branch_id = loans.branch_id
GROUP BY branch_name;

SELECT branch_name, COUNT(account_id)
FROM
palmpay_db.branches
JOIN accounts
ON accounts.branch_id = branches.branch_id
GROUP BY branch_name;

