# fx_feed.cr
Web-API for [fxfeed.io](https://fxfeed.io/) the fast, developer friendly, and reliable FX-rate API

## Example
```cr
require "./fx_feed"

fx_feed = FxFeed.new(api_key="demo")
latest_rates = fx_feed.get_latest_rates(
	base="USD", currencies="EUR,GBP")
puts latest_rates
```
