# Overwatch API
- [Overwatch API](#overwatch-api)
- [Get Started](#get-started)
- [API Endpoints](#api-endpoints)
  - [`GET /heros`](#get-heros)
  - [`GET /heros/:id`](#get-herosid)
  - [`GET /teams/:id`](#get-teamsid)
  - [`POST /teams`](#post-teams)
- [Data](#data)
  - [Hero](#hero)
  - [Ability](#ability)
  - [Teams](#teams)
- [Rake Tasks](#rake-tasks)

# Get Started

To use the API, you just need to create a User for yourself, and then generate your personal API key for authorization.

1. First you must create a user for yourself. Submit an HTTP POST to `/api/v1/users` with the following request body:
```json
{
  "email": "your_email",
  "password": "your_password",
  "password_confirmation": "your_password"
}
```
Response will be your newly created User
2. Using HTTP Basic Authorization, submit a POST to `/api/v1/api_keys` with your newly created email/password to receive your API Key as a string.
3. Copy your API key and use it in all subsequent requests in the Authoriaation header. It should look like this:
```json
"Authorization": "Bearer YOUR_API_KEY"
```
That's it! You should now be able to access any other endpoint. Note that if you generate a new API key, your old one will no longer work.

# API Endpoints

## `GET /heros`
Returns *`Hero[]`*
List all Heroes

## `GET /heros/:id`
Returns *Hero*
Returns Hero with given `id`
## `GET /teams/:id`
Returns *Team*
Returns Team with given `id`

## `POST /teams`
Returns *Team*
Submit an array of Hero IDs to view their Team and the optimal counter composition for that Team.
Request Body:
```json
{
  "team": {
    "hero_ids": [ 1,2,3,4,5,6 ]
  }
}
```

# Data

All times (durations) are measured in milliseconds. Rates are measured as a float, *x* per second.

## Hero

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
*integer* Amount of time after using the ability until it takes effect (since ability is deployed, it can not be stun canceled at this point). Synonomous to a "fuse" like D.Va's Self-Destruct

__`cooldown_timer_delay`__  
*integer* Amount of time after triggering the ability until the cooldown timer begins


## Teams

# Rake Tasks

To build the counter relationships:
`rake build_counters`

To also copy the data to your test DB:
`rake db:recalc`

To only copy the Development DB to your test DB:
`rake db:copy_db`