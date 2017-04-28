CREATE DEFINER=`root`@`localhost` PROCEDURE `JON_ApprovedProject`(IN PID int)
BEGIN
Set @currentdate = CURDATE();
Set @approvedin = (Select approvedin from project where project.id = PID);
IF (@approvedin IS NULL) THEN 
	RETURN 0;
ELSEIF (CAST(currentdate as DATE) >= CAST(approvedin as DATE)) THEN 
	RETURN 1;
ELSE 
	RETURN 0;
END IF;
END

CREATE PROCEDURE `JON_InsertNewAdmin` (IN ID INT)
BEGIN
Set @typeid = (Select id from type where type.desc = 'admin');
Update user set typeid = @typeid where id = ID;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `JON_RemoveUserGroup`(IN GID INT, IN ID INT)
BEGIN
Delete from groupuser where groupuser.groupid = GID && groupuser.userid = ID;
END

CREATE PROCEDURE `JON_ListGroupUsers` (IN GID Int)
BEGIN
Select id.a, username.a from users as a, groupuser as b, group as c where c.id = GID && b.groupid = c.id && a.id = b.userid;
END

