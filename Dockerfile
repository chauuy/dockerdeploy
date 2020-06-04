FROM mcr.microsoft.com/dotnet/core/runtime:3.1-alpine3.11

# Install ASP.NET Core
RUN aspnetcore_version=3.1.4 \
    && wget -O aspnetcore.tar.gz https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/$aspnetcore_version/aspnetcore-runtime-$aspnetcore_version-linux-musl-x64.tar.gz \
    && aspnetcore_sha512='f60e9226a5b399470479fd6fdebd03442b0440128be1090adcbe473dba46a3e7a57a9e59b4abff96214e0dd0b1123c67fe764b74c61de1cb35c8b8ac45767eb9' \
    && echo "$aspnetcore_sha512  aspnetcore.tar.gz" | sha512sum -c - \
    && tar -ozxf aspnetcore.tar.gz -C /usr/share/dotnet ./shared/Microsoft.AspNetCore.App \
    && rm aspnetcore.tar.gz
    
RUN mkdir /app
COPY hello-world.csproj /app/hello-world.csproj
COPY Program.cs /app/Program.cs
RUN ls -l
RUN ls -l /app

RUN dotnet build /app/hello-world.csproj -c Release -o /app/build

RUN dotnet publish /app/hello-world.csproj -c Release -o /app/publish

WORKDIR /app
#COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "hello-world.exe", "--environment=Development"]
