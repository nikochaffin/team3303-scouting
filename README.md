# Team 3303 Scouting

Lightweight Rails application for collecting data about the other FRC teams that
you're competing with, per year, per region.

--------------------------------------------------------------------------------

## Notes

### Models

- **Team**
    - `team_number`
    - `team_name`
    - `team_password` (optional?)
    - `admin_password`
    - `current_game` (selected from **Game** instances)
- **Game**
    - Has a `name`
    - Changes each `year`
    - Should have many options for the `scoring_fields`, possibly with different
    input types (text, int, range, etc)
- **Scoring Field**
    - `name`
    - `description` (optional)
    - `field_type` (text, int, range)
- **Competition Region**
    - Should have many `games` (relation to indicate)
    - Should have a list of `team_numbers` (a text field storing serialized array
      of the teams that will be at the competition for that region)
- **Scoring Entry**
    - belongs to a `game` (should be set for the user)
    - has a `team` (a text field with the team number)
    - `properties` (this is a `text` column for storing a serialized hash based on
      the values filled out in the form, since the properties will be dynamic and
      based on which game is active)
    - can have `notes` (optional)
