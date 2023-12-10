ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;


CREATE POLICY select_self_user ON "User" 
FOR SELECT
USING (Login = current_user);


CREATE OR REPLACE FUNCTION current_user_id() RETURNS integer AS $$
DECLARE
    user_id integer;
BEGIN
    SELECT ID INTO user_id FROM "User" WHERE login = CURRENT_USER;
    RETURN user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;