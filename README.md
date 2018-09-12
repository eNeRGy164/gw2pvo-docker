# gw2pvo-docker
GoodWe to PVOutput Docker Container

This Docker Container runs the [gw2pvo](https://github.com/markruys/gw2pvo) tool by [Mark Ruys ](https://github.com/markruys)

## Usage

```
docker create \
	--name gw2pvo \
	-e GW_STATION_ID=<goodwe_system_id> \
	-e PVO_SYSTEM_ID=<pvoutput_system_id> \
	-e PVO_API_KEY=<pvoutput_api_key> \ 
	energy164/gw2pvo
```


## Parameters

- `-e KEY="value"` These are environment variables which configure the container.  See below for a description of their meanings.

The following are the required parameters:

- **GW_STATION_ID** Set the GoodWe Station ID.
- **PVO_SYSTEM_ID** Set the PVOutput System ID.
- **PVO_API_KEY** Set the PVOutput API Key.

These parameters are optional:

- **LOG** Set the log level.  Defaults to `info`.  Allowed values are `debug`, `info`, `warning`, `critical`.
- **GW_REGION** Set the region to use to query data from GoodWe.  Defaults to `global`.  Allowed values are `global`, `AU`, `EU`.
- **PVO_INTERVAL** Set the interval to send data to PVOutput.  Defaults to `15`.  Allowed values are `5`, `10`, `15`.
- **CITY** Skip uploads from dusk till dawn based on this City.  Defaults to: `Amsterdam`.  The complete list can be found here: [https://astral.readthedocs.io/en/stable/index.html](https://astral.readthedocs.io/en/stable/index.html)
- **TZ** Set the timezone inside the container.  Defaults to: `Europe/Amsterdam`.  The complete list can be found here: [https://en.wikipedia.org/wiki/List_of_tz_database_time_zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
