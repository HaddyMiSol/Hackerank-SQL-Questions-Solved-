--HACKERANK ALTERNATIVE QUERIES QUESTIONS SOLVED

--Draw The Triangle 1
DECLARE @var smallint = 20;

WHILE @var > 0
BEGIN
    SELECT REPLICATE('* ', @var);
    SET @var -= 1;
END;

--Draw The Triangle 2
DECLARE @var smallint = 1;

WHILE @var < 21
BEGIN
    SELECT REPLICATE('* ', @var);
    SET @var += 1;
END;

--Print Prime Numbers
DECLARE
@i INT,
@a INT,
@p varchar(1000),
@count INT
SET @i=1
WHILE(@i<=1000)
BEGIN 
    SET @count=0
    SET @a=1

    WHILE(@a<=@i)
    BEGIN
        IF (@i % @a=0)
            SET @count= @count+1;
            SET @a=@a+1;
    END

        if(@count=2)
        BEGIN
            IF(@p is null)
                Set @p=""+@i;
            else
                SET @p= @p+"&"+cast(@i as varchar);
        END        
        SET @i=@i+1;

END
print @p
