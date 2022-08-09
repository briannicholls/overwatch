# Overwatch API
- [Overwatch API](#overwatch-api)
  - [The Data](#the-data)
    - [Ability](#ability)
      - [`fire_rate` `float`](#fire_rate-float)
      - [`projectiles_per_shot` `float`](#projectiles_per_shot-float)
      - [`projectiles_fired_per_second` `float`](#projectiles_fired_per_second-float)
      - [`projectiles_fired_per_second` `float`](#projectiles_fired_per_second-float-1)
  - [Heroes](#heroes)
      - [GET /hero](#get-hero)
  - [Abilities](#abilities)
  - [Teams](#teams)

## The Data

### Ability
#### `fire_rate` `float`
Maximum rate of fire for this ability while it is active. Used in claculating DPS if ability `is_primary_fire`.
Note that this is the rate of fire for the weapon, i.e. "gun blasts" per second. A single gun blast may shoot multiple projectiles - see `projectiles_per_shot` (only for abilities with `is_projectile`)

#### `projectiles_per_shot` `float`
Number of projectiles fired from a single blast of this weapon (only for abilities with `is_projectile`)

#### `projectiles_fired_per_second` `float`
How many total projectiles leave the weapon per second (only for abilities with `is_projectile`)

#### `projectiles_fired_per_second` `float`
How many total projectiles leave the weapon per second (only for abilities with `is_projectile`)

##

## Heroes

#### GET /hero


## Abilities


## Teams