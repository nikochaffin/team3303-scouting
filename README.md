# Team 3303 Scouting

Lightweight Rails application for collecting data about the other FRC teams that
you're competing with, per year, per region.

--------------------------------------------------------------------------------

## Notes

### Models

#### User
- `username` (string)
- `password_digest` (string, optional)
- Users can be created with or without passwords, but only users with passwords
are allowed to make changes to **TeamSettings**. Users without passwords can
login with a session for submitting **Scoring Entries**

#### TeamSettings (a Settings table with keyword and value columns)
- `team_number` (int)
- `team_name` (string)

#### Game
- Has a `name`
- Changes each `year` (int)
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
- belongs to a `user`
- belongs to a `game` (should be set for the user)
- has a `team_scored` (a text field with the team number, choose from teams
  competing in this competition region)
- `properties` (this is a `text` column for storing a serialized hash based on
  the values filled out in the form, since the properties will be dynamic and
  based on which game is active)
- can have `notes` (optional)
