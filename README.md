# Overwatch API
- [Overwatch API](#overwatch-api)
  - [Hero](#hero)
    - [`hp`](#hp)
    - [`shield`](#shield)
    - [`armor`](#armor)
  - [Ability](#ability)
    - [`fire_rate`](#fire_rate)
    - [`projectiles_per_shot`](#projectiles_per_shot)
    - [`projectiles_fired_per_second`](#projectiles_fired_per_second)
    - [`cast_time`](#cast_time)
    - [`recovery_time`](#recovery_time)
    - [`cast_animation_time`](#cast_animation_time)
    - [`cooldown_timer_delay`](#cooldown_timer_delay)
  - [Teams](#teams)


All times (durations) are measured in milliseconds. Rates are measured as a float, *x* per second.

## Hero

`GET /hero`
### `hp`
*integer* Starting points, not including `armor` and `shield`

### `shield`
*integer* Starting shields

### `armor`
*integer* Starting armor


## Ability
### `fire_rate`
*integer* Maximum rate of fire for this ability while it is active. Used in claculating DPS if ability `is_primary_fire`.
Note that this is the rate of fire for the weapon, i.e. "gun blasts" per second. A single gun blast may shoot multiple projectiles - see `projectiles_per_shot` (only for abilities with `is_projectile`)

### `projectiles_per_shot`
*float* Number of projectiles fired from a single blast of this weapon (only for abilities with `is_projectile`)

### `projectiles_fired_per_second`
*float* How many total projectiles leave the weapon per second (only for abilities with `is_projectile`)

### `cast_time`
*integer* Amount of time it takes for ability to be cast. The Hero can be stunned out of casting the ability during this time, in contrast to `cooldown_timer_delay`, `reovery_time`, and `cast_animation_time` (see below)

### `recovery_time`
*integer* Amount of time after using ability in which the hero may not perform any other actions

### `cast_animation_time`
*integer* Amount of time after using the ability until it takes effect (since ability is deployed, it can not be stun canceled at this point)

### `cooldown_timer_delay`
*integer* Amount of time after triggering the ability until the cooldown timer begins


## Teams