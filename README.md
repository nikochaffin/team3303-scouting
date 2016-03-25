# Team 3303 Scouting

Lightweight Rails application for collecting data about the other FRC teams that
you're competing with, per year, per region.

--------------------------------------------------------------------------------

## Notes

### Models

#### User
- `username` (string)
- `password_digest` (string)
- `is_admin` (boolean)

#### TeamSettings (a Settings table with keyword and value columns)
- `team_number` (int)
- `team_name` (string)
- `team_password_digest` (string)
- `current_game` (selected from **Game** instances)

#### Game
- Has a `name`
- Changes each `year`
- Should have many options for the `scoring_fields`, possibly with different
input types (text, int, range, etc)

#### Scoring Field
- `name`
- `description` (optional)
- `field_type` (text, int, range)

#### Competition Region
- Should have many `games` (relation to indicate)
- Should have a list of `team_numbers` (a text field storing serialized array
  of the teams that will be at the competition for that region)

#### Scoring Entry
- belongs to a `game` (should be set for the user)
- has a `team_scored` (a text field with the team number, choose from teams
  competing in this competition region)
- `properties` (this is a `text` column for storing a serialized hash based on
  the values filled out in the form, since the properties will be dynamic and
  based on which game is active)
- can have `notes` (optional)
