ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION current_user_id() RETURNS integer AS $$
DECLARE
    user_id integer;
BEGIN
    SELECT ID INTO user_id FROM "User" WHERE login = CURRENT_USER;
    RETURN user_id;
END;

CREATE POLICY update_own_user_student ON "User" 
    FOR UPDATE TO Student
    USING (ID = current_user_id());

CREATE POLICY update_own_user_teacher ON "Teacher" 
    FOR UPDATE TO Teacher
    USING (ID = current_user_id());