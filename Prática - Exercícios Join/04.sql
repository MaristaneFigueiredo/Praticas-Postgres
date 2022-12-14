SELECT ex."userId", users.name, roles.name AS role, companies.name AS company, ex."starDate" 
FROM experiences ex INNER JOIN roles ON ex."roleId" = roles.id 
INNER JOIN users ON ex."userId" = users.id INNER JOIN companies ON ex."companyId" = companies.id WHERE ex.id = 50 and ex."endDate" IS NULL;

