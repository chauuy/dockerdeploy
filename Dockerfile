FROM mcr.microsoft.com/dotnet/core/samples:aspnetapp
#pas repris par le Deployment LABEL "app.kubernetes.io/name"=dotnet
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
