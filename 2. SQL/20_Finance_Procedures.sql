-- Create Record Invoice Payment Procedure
CREATE OR REPLACE PROCEDURE sp_record_invoice_payment(

    p_invoice_id INTEGER,
    p_payment_amount NUMERIC

)

LANGUAGE plpgsql

AS
$$
BEGIN

    UPDATE invoices

    SET

        paid_amount = paid_amount + p_payment_amount,

        outstanding_amount = total_amount - (paid_amount + p_payment_amount),

        updated_at = CURRENT_TIMESTAMP

    WHERE invoice_id = p_invoice_id;

END;
$$;

-- Create Update Invoice Status Procedure
CREATE OR REPLACE PROCEDURE sp_update_invoice_status(

    p_invoice_id INTEGER,
    p_status VARCHAR

)

LANGUAGE plpgsql

AS
$$
BEGIN

    UPDATE invoices

    SET

        status = p_status,
        updated_at = CURRENT_TIMESTAMP

    WHERE invoice_id = p_invoice_id;

END;
$$;

-- Create Payment Transaction Procedure
CREATE OR REPLACE PROCEDURE sp_create_payment(

    p_payment_reference VARCHAR,
    p_invoice_id INTEGER,
    p_payment_method_id INTEGER,
    p_payment_date DATE,
    p_payment_amount NUMERIC,
    p_transaction_reference VARCHAR,
    p_remarks TEXT

)

LANGUAGE plpgsql

AS
$$
BEGIN

    INSERT INTO payments(

        payment_reference,
        invoice_id,
        payment_method_id,
        payment_date,
        payment_amount,
        transaction_reference,
        remarks,
        created_at

    )

    VALUES(

        p_payment_reference,
        p_invoice_id,
        p_payment_method_id,
        p_payment_date,
        p_payment_amount,
        p_transaction_reference,
        p_remarks,
        CURRENT_TIMESTAMP

    );

END;
$$;

-- Create Recalculate Invoice Balance Procedure
CREATE OR REPLACE PROCEDURE sp_recalculate_invoice_balance(

    p_invoice_id INTEGER

)

LANGUAGE plpgsql

AS
$$
BEGIN

    UPDATE invoices i

    SET

        paid_amount = COALESCE(

            (
                SELECT SUM(payment_amount)

                FROM payments

                WHERE invoice_id = i.invoice_id

            ),

            0

        ),

        outstanding_amount =

            total_amount -

            COALESCE(

                (
                    SELECT SUM(payment_amount)

                    FROM payments

                    WHERE invoice_id = i.invoice_id

                ),

                0

            ),

        updated_at = CURRENT_TIMESTAMP

    WHERE invoice_id = p_invoice_id;

END;
$$;

CALL sp_update_invoice_status(
    1,
    'Paid'
);

CALL sp_record_invoice_payment(
    1,
    5000
);

CALL sp_recalculate_invoice_balance(
    1
);




