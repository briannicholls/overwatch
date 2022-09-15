# Overwatch API
- [Overwatch API](#overwatch-api)
  - [Hero](#hero)
  - [Ability](#ability)
  - [Teams](#teams)


All times (durations) are measured in milliseconds. Rates are measured as a float, *x* per second.

## Hero

`GET /hero`
__`hp`__  
*integer* Starting points, not including `armor` and `shield`

__`shield`__  
*integer* Starting shields

__`armor`__  
*integer* Starting armor


## Ability
__`fire_rate`__  
*integer* Maximum rate of fire for this ability while it is active. Used in claculating DPS if ability `is_primary_fire`.
Note that this is the rate of fire for the weapon, i.e. "gun blasts" per second. A single gun blast may shoot multiple projectiles - see `projectiles_per_shot` (only for abilities with `is_projectile`)

__`projectiles_per_shot`__  
*float* Number of projectiles fired from a single blast of this weapon (only for abilities with `is_projectile`)

__`projectiles_fired_per_second`__  
*float* How many total projectiles leave the weapon per second (only for abilities with `is_projectile`)

__`cast_time`__  
*integer* Amount of time it takes for ability to be cast. The Hero can be stunned out of casting the ability during this time, in contrast to `cooldown_timer_delay`, `reovery_time`, and `cast_animation_time` (see below)

__`recovery_time`__  
*integer* Amount of time after using ability in which the hero may not perform any other actions

__`cast_animation_time`__  
*integer* Amount of time after using the ability until it takes effect (since ability is deployed, it can not be stun canceled at this point)

__`cooldown_timer_delay`__  
*integer* Amount of time after triggering the ability until the cooldown timer begins


## Teams