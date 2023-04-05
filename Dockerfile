# Set the base image for the build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the .csproj file and restore dependencies
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Set the base image for the runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app

# Expose the desired port
EXPOSE 50001

# Copy the output from the build stage
COPY --from=build /app/out .

# Set the entrypoint for the container
ENTRYPOINT ["dotnet", "WeatherApi.dll"]
