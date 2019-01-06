
DELETE FROM rbac_linked_permissions WHERE id=192 AND linkedId IN (1002, 1003, 1004, 1005, 1006, 1007, 1008);
INSERT INTO rbac_linked_permissions VALUES 
(192, 1002),
(192, 1003),
(192, 1004),
(192, 1005),
(192, 1006),
(192, 1007),
(192, 1008);
