// this function is regarding rounded price
FUNCTION Is_Discounted_Price_Rounded (
   order_no_     IN VARCHAR2 ) RETURN BOOLEAN
IS
   disc_price_rounded_ BOOLEAN := FALSE;
   use_price_incl_tax_ CUSTOMER_ORDER_TAB.use_price_incl_tax%TYPE;
   // CUSTOMER_ORDER_TAB added in the cursor
   CURSOR get_disc_price_rounded IS
      SELECT use_price_incl_tax
      FROM   CUSTOMER_ORDER_TAB
      WHERE  order_no = order_no_;
BEGIN
   OPEN get_disc_price_rounded;
   FETCH get_disc_price_rounded INTO  use_price_incl_tax_;
   CLOSE get_disc_price_rounded;

   IF (use_price_incl_tax_ = Fnd_Boolean_API.DB_FALSE) THEN
      disc_price_rounded_ := TRUE;   
   END IF;
   RETURN  disc_price_rounded_;
END Is_Discounted_Price_Rounded;  
