



CREATE POLICY select_self_user ON "User" 
FOR SELECT
USING (Login = current_user);

