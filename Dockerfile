
FROM mcr.microsoft.com/dotnet/core/samples:aspnetapp

RUN ls -l /app/

WORKDIR /app
#settings aussi dans appsettings.json
ENV ASPNETCORE_URLS=http://+:8000
EXPOSE 8000

ENTRYPOINT ["dotnet", "aspnetapp.dll"]
#RUN dotnet run /app/aspnetapp &
