
DELETE FROM rbac_permissions WHERE id IN (1002, 1003, 1004, 1005, 1006, 1007, 1008);
INSERT INTO rbac_permissions VALUES 
(1002, "Command: AntiCheat"),
(1003, "Command: AntiCheat: Global"),
(1004, "Command: AntiCheat: Player"),
(1005, "Command: AntiCheat: Handle"),
(1006, "Command: AntiCheat: Delete"),
(1007, "Command: AntiCheat: Jail"),
(1008, "Command: Don't apply AntiCheat");
