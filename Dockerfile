FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["src/Person.Api/Person.Api.csproj", "src/Person.Api/"]
COPY ["src/Person.Persistence/Person.Persistence.csproj", "src/Person.Persistence/"]
COPY ["src/Person.Application/Person.Application.csproj", "src/Person.Application/"]
COPY ["src/Person.Domain/Person.Domain.csproj", "src/Person.Domain/"]
COPY ["src/Person.Infrastructure/Person.Infrastructure.csproj", "src/Person.Infrastructure/"]
RUN set HTTP_PROXY=192.168.10.10:8080 && \
set HTTPS_PROXY=192.168.10.10:8080 && \
dotnet restore "src/Person.Api/Person.Api.csproj" --source http://nexus-lu.balgroupit.com/repository/nuget
COPY . .
WORKDIR "/src/src/Person.Api"
RUN dotnet build "Person.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Person.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Person.Api.dll", "--environment=Development"]
