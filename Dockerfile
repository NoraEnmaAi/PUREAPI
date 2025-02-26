# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID

WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Copy published files into the container
COPY publish ./


USER root
RUN mkdir -p /app/wwwroot && chmod -R 777 /app/wwwroot
RUN chown -R $APP_UID /app/wwwroot

# Run the app
ENTRYPOINT ["dotnet", "WebApplication3.dll"]