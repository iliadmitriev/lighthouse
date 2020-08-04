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
docker run -itv ${PWD}/reports:/home/chrome/reports --rm unicom/lighthouse lighthouse --chrome-flags="--headless --disable-gpu --no-sandbox" --no-enable-error-reporting https://unicom24.ru/
```

### Chromium Flags

| Flag | Explanation | 
|---|---|
| --no-sandbox | Disables the sandbox for all process types that are normally sandboxed. Meant to be used as a browser-level switch for testing purposes only. Needed to run in docker |
| --headless | Needed to run in docker |
| --user-agent | User-Agent string in HTTP request, may be set to LightHouse |

https://www.chromium.org/developers/how-tos/run-chromium-with-flags
https://peter.sh/experiments/chromium-command-line-switches/
