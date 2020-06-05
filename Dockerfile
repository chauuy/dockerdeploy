FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

# Install .NET Core SDK v3.1.104 
RUN export DOTNET_ROOT=/usr/share/dotnet \
&& export PATH=$PATH:/usr/share/dotnet

RUN mkdir /webapp
RUN mkdir /webapp/Properties

COPY hello-world.csproj /webapp/hello-world.csproj
#COPY appsettings.json /webapp/appsettings.json
COPY Program.cs /webapp/Program.cs
COPY launchSettings.json /webapp/Properties/launchSettings.json

RUN dotnet build /webapp/hello-world.csproj -c Release -o /webapp/bin

#RUN ls -l /webapp/build
#RUN dotnet publish /webapp/hello-world.csproj -c Release -o /webapp/publish
#RUN ls -l /webapp/publish

WORKDIR /webapp/bin
#ENV replace appsettings.json
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

#ENTRYPOINT ["dotnet", "hello-world.dll"]
RUN dotnet run /webapp/hello-world.dll &
