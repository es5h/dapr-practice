run dapr on docker

```dapr init```
```shell
 dapr run --app-id weatherapi --app-port 5001 --dapr-http-port 50001 dotnet run
```

```shell
http://localhost:<port>/v1.0/invoke/<appid>/method/<methodname>
http://localhost:50001/v1.0/invoke/weatherapi/method/weatherforecast
```

```
INVOKE-RestMethod -Method Get -Uri 'http://localhost:50001/v1.0/invoke/weatherapi/method/weatherforecast'
```