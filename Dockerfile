FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a releaseprabhat
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "prabhatapiapp.dll"]
#################################################################
# FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env
# WORKDIR /src
# COPY src/*.csproj .
# RUN dotnet restore
# COPY src .
# RUN dotnet publish -c Release -o /publish

# FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime
# WORKDIR /publish
# COPY  --from=build-env /publish .
# EXPOSE 80
# ENTRYPOINT ["dotnet", "prabhatapiapp.dll"]
##############################################################

