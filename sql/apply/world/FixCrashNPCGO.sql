-- fix  crash on use .gobject near
update  trinity_string set content_default="%s (Entry: %u) - |cffffffff|Hgameobject:%s|h[%s X:%f Y:%f Z:%f O:%f MapId:%u]|h|r " where entry=517;

-- fix  crash on use .npc near
update  trinity_string set content_default="%s - |cffffffff|Hcreature:%s|h[%s X:%f Y:%f Z:%f O:%f MapId:%u]|h|r " where entry=515;