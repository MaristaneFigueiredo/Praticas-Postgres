SELECT te.id,  u.name AS writer,  u.name AS recipient, te.message  
    FROM testimonials te INNER JOIN users u ON te."writerId" = u.id AND te."recipientId" = u.id;

