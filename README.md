# D.A.R.T
Direct Automotive Reciver & Transmitter

![D.A.R.T](https://media.discordapp.net/attachments/982855421779922944/1113885039541882970/64756725cd2c8.webp)

D.A.R.T is a resource for FiveM that provides driver assistance and vehicle tracking functionality for emergency vehicles. It allows players to mark and track nearby vehicles, enhancing their ability to respond to emergencies effectively. The resource includes server-side and client-side scripts, along with a configuration file to customize various options.

## Features

- Track nearby vehicles from an emergency vehicle

- Marked vehicle location updates in real-time on the map

- Cooldown system to prevent spamming the tracking feature

- Customizable blip settings

## Roadmap

Here's a roadmap of the planned features and improvements for D.A.R.T:

- [x] Implement basic vehicle tracking functionality

- [x] Add cooldown system to prevent spamming

- [x] Customize blip settings

- [ ] Add particle effect to indicate marked vehicles

- [ ] Implement sound effects for tracking events

- [ ] Create a job bridge for integration with job systems (e.g., ESX, vRP)

- [ ] Add additional configurable options for more customization

- [ ] Implement a command to toggle tracking on/off

- [ ] Add support for marking multiple vehicles simultaneously

- [ ] Bug fixes and optimizations

## Installation

1. Download the latest release of D.A.R.T.

2. Extract the contents of the ZIP file into your FiveM server resources folder.

3. Add `start dart` to your server.cfg file.

## Configuration

You can customize the behavior of D.A.R.T by modifying the options in the `config.lua` file. Here are the configurable options:

- `TrackingDuration`: The duration (in seconds) for which a vehicle is tracked.

- `CooldownDuration`: The duration (in seconds) of the cooldown period between tracking attempts.

- `BlipSprite`: The sprite ID of the blip displayed on the map for marked vehicles.

- `BlipColor`: The color ID of the blip displayed on the map for marked vehicles.

- `BlipDisplay`: The display mode of the blip on the map for marked vehicles.

## Usage

To start tracking a nearby vehicle, enter an emergency vehicle and use the `/firedart` command. The nearest vehicle will be marked with a blip on the map, indicating its location. The blip will be visible to all players on the server. There is a cooldown period between each tracking attempt to prevent spamming.

## License

D.A.R.T is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

