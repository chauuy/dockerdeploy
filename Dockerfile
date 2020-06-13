FROM mcr.microsoft.com/dotnet/core/samples:aspnetapp
LABEL "app.kubernetes.io/name"=dotnet
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
