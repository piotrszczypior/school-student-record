ALTER TABLE Address ENABLE ROW LEVEL SECURITY;

CREATE POLICY update_own_address ON Address 
    FOR UPDATE TO Student
    USING (userID = current_user_id());