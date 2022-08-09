select heros.name from heros
left join abilities on abilities.hero_id = heros.id
order by 
abilities.fire_rate desc;

