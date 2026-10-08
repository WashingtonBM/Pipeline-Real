-- Camada 4: Regra de Detecção de Fraude por Velocidade
-- Identifica cartões com 3 ou mais transações em uma janela curta de tempo
SELECT 
    card_id,
    COUNT(transaction_id) AS total_transactions,
    MAX(amount) AS max_amount,
    MIN(transaction_time) AS first_transaction,
    MAX(transaction_time) AS last_transaction,
    CASE 
        WHEN COUNT(transaction_id) >= 3 THEN 'ALERTA_FRAUDE_VELOCITY'
        ELSE 'NORMAL'
    END AS fraud_status
FROM transactions
GROUP BY card_id
HAVING COUNT(transaction_id) >= 3;
