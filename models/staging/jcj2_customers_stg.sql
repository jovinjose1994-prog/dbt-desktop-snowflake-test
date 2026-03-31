SELECT
    CustomerID,
    FirstName,
    LastName,
    Email,
    Phone,
    Address,
    City,
    State,
    ZipCode,
    Updated_at,
    CONCAT(FirstName, ' ', LastName) AS CustomerName,
    UPPER(
        LEFT(TRIM(COALESCE(FirstName, '')), 1) ||
        LEFT(TRIM(COALESCE(LastName, '')), 1)
    ) AS Initials,
    CONCAT(COALESCE(FirstName, ''), 'x', COALESCE(LastName, '')) AS FullName_X,
    CONCAT(COALESCE(FirstName, ''), 'Y', COALESCE(LastName, '')) AS FullName_Y
FROM {{ source('landing', 'customers') }}