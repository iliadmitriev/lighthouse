# Lighthouse CLI with Headless Chromium

## Building
```
docker build -t unicom/lighthouse ./
```

## Running

1. Create directory `reports`
```
mkdir reports
```

2. Run container
```
docker run -v ${PWD}/reports:/home/chrome/reports --rm unicom/lighthouse lighthouse --chrome-flags="--headless --disable-gpu --no-sandbox" --no-enable-error-reporting https://www.google.com/
```

3. Read report in directory `reports`

4. Get JSON report on screen
```
docker run -v ${PWD}/reports:/home/chrome/reports --rm unicom/lighthouse lighthouse --chrome-flags="--headless --disable-gpu --no-sandbox" --output json --no-enable-error-reporting --output-path stdout --quiet https://www.google.com/
```

### Lighthouse flags

| Flag | Explanation | 
|---|---|
| --no-enable-error-reporting | Do not ask question about Error Reporting to Google at the first start of lighthouse |
| --chrome-flags | Pass flags to headless chrome |
| --verbose | Displays verbose logging |
| --quiet | Displays no progress, debug logs or errors |
| --port                         | The port to use for the debugging protocol. Use 0 for a random port|
| --hostname                     | The hostname to use for the debugging protocol. Default "localhost"|
| --gather-mode, -G              | Collect artifacts from a connected browser and save to disk. (Artifacts folder path may optionally be provided). If audit-mode is not also enabled, the run will quit early.|
| --audit-mode, -A               | Process saved artifacts from disk. (Artifacts folder path may be provided, otherwise defaults to ./latest-run/)|
|--output      | Reporter for the results, supports multiple values. choices: "json", "html", "csv"|
|--output-path |  The file path to output the results. Use 'stdout' to write to stdout. If using JSON output, default is stdout. If using HTML or CSV output, default is a file in the working directory with a name based on the test URL and date. If using multiple outputs, --output-path is appended with the standard extension for each output type. "reports/my-run" -> "reports/my-run.report.html", "reports/my-run.report.json", etc. Example: --output-path=./lighthouse-results.html |
|--emulated-form-factor| Controls the emulated device form factor (mobile vs. desktop) if not disabled [choices: "mobile", "desktop", "none"] [default: "mobile"] |
|--throttling-method| Controls throttling method [choices: "devtools", "provided", "simulate"] |


### Chromium flags

| Flag | Explanation | 
|---|---|
| --no-sandbox | Disables the sandbox for all process types that are normally sandboxed. Meant to be used as a browser-level switch for testing purposes only. Needed to run in docker |
| --headless | Needed to run in docker |
| --user-agent | User-Agent string in HTTP request, may be set to LightHouse |

https://www.chromium.org/developers/how-tos/run-chromium-with-flags
https://peter.sh/experiments/chromium-command-line-switches/
